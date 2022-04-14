//
//  MapViewController.swift
//  Chinatown
//
//  Created by Cleo Xiao on 4/14/22.
//


import UIKit
import MapKit
import RealityKit

class MapViewController: UIViewController {
    
    
    @IBOutlet private var mapView: MKMapView!
    // Set initial location in Chinatown
    let initialLocation = CLLocation(latitude: 40.71521, longitude: -73.99869)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStartingPosition()
        
        mapView.delegate = self
        //show landmark on map
        let WOW = Landmark( title: "Wing on Wo", subtitle: "Porcelain", discipline: "Porcelain Store", coordinate: CLLocationCoordinate2D(
            latitude: 40.71521,
            longitude: -73.99869
        )
        )
        mapView.addAnnotation(WOW)
        
        
    }
    
    func setStartingPosition(){
        
        let position =  MKCoordinateRegion(center: initialLocation.coordinate,
                                           latitudinalMeters: 500,
                                           longitudinalMeters: 500)
        
        mapView.setRegion(position, animated: true)
    }
    
    
    

        
    
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Landmark else {
            return nil
        }
        let identifier = "landmark"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
            view.image = UIImage(named: "pin")
        } else {
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.image = UIImage(named: "pin")
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            let image = UIImage(named: "WingOnWoIcon")
            let button = UIButton(type:.custom)
            button.frame = CGRect(x:0,y:0,width:30,height:30)
            button.setImage(image, for: .normal)
            view.leftCalloutAccessoryView = button
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let landmark = view.annotation as? Landmark else{
            return
        }
        guard let name = landmark.title else{
            return
        }
        self.performSegue(withIdentifier: name, sender: control)
    }
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


