//
//  MapViewController.swift
//  Chinatown
//
//  Created by Cleo Xiao on 4/14/22.
//


import UIKit
import MapKit

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
    // 1
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Landmark else {
            return nil
        }
        // 3
        let identifier = "landmark"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            //view.image = UIImage(named: "WingOnWoIcon")
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
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


