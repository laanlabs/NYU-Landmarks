//
//  Landmark.swift
//  Chinatown
//
//  Created by Cleo Xiao on 4/14/22.
//

import Foundation
import MapKit

class Landmark: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let icon: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        subtitle: String?,
        icon: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.coordinate = coordinate
        
        super.init()
    }
    
}

