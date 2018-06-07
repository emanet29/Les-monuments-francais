//
//  MonAnnotation.swift
//  Les monuments francais
//
//  Created by Snoopy on 07/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    let image = #imageLiteral(resourceName: "Group")
    var coordinate : CLLocationCoordinate2D
    
    init(titre:String, adresse: String, coordonnees: CLLocationCoordinate2D) {
        self.title = titre
        self.subtitle = adresse
        self.coordinate = coordonnees
        super.init()
    }
    
    
    
}
