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
    @IBOutlet weak var button: UIButton!
    
    // Set initial location in Chinatown
    let initialLocation = CLLocation(latitude: 40.71420675499155,  longitude: -73.99722752890992)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStartingPosition()

        
        mapView.delegate = self
//        //show landmark on map
        let WOW = Landmark( title: "Wing on Wo", subtitle: "Porcelain Store", icon: "WingOnWoIcon", coordinate: CLLocationCoordinate2D(
            latitude: 40.71521,
            longitude: -73.99869
        )
        )
        mapView.addAnnotation(WOW)
        
        let ballroom = Landmark(title: "Imperial Ballroom", subtitle: "Dance Studio", icon: "BallroomIcon", coordinate: CLLocationCoordinate2D(
            latitude: 40.7142311514786,
            longitude: -73.9960580857825
        ))
       mapView.addAnnotation(ballroom)
//

        button.setImage(UIImage(named: "pin2"), for: .normal)
        button.configuration?.imagePadding = 10
        button.layer.cornerRadius = 24.0
        button.setTitle("Tap a pin to start exploring!", for: .normal)
        
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
//        let identifier = "landmark"
//        var view: MKMarkerAnnotationView
//        if let dequeuedView = mapView.dequeueReusableAnnotationView(
//            withIdentifier: identifier) as? MKMarkerAnnotationView {
//            dequeuedView.annotation = annotation
//            view = dequeuedView
//            view.image = UIImage(named: "pin")
//        } else {
//            view = MKMarkerAnnotationView(
//                annotation: annotation,
//                reuseIdentifier: identifier)
//            view.image = UIImage(named: "pin")
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//
//            let image = UIImage(named: "WingOnWoIcon")
//            let button = UIButton(type:.custom)
//            button.frame = CGRect(x:0,y:0,width:30,height:30)
//            button.setImage(image, for: .normal)
//            view.leftCalloutAccessoryView = button
//        }
//        guard !(annotation is MKUserLocation) else {
//            return nil
//        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "pin")
        let rightbutton = UIButton(type: .custom)
        rightbutton.frame = CGRect(x:0,y:0,width:30,height:30)
        rightbutton.setImage(UIImage(named: "next"), for: .normal)
        annotationView?.rightCalloutAccessoryView = rightbutton
        
        let name = annotation.icon!
        print(name)
        let image = UIImage(named: name)
        let button = UIButton(type:.custom)
        button.frame = CGRect(x:0,y:0,width:30,height:30)
        button.setImage(image, for: .normal)
        annotationView?.leftCalloutAccessoryView = button
        
        
        return annotationView
        
        
        //return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let landmark = view.annotation as? Landmark else{
            return
        }
        print("click")
        guard let name = landmark.title else{
            return
        }
        print(name)
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


