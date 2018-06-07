//
//  CLLocationExtension.swift
//  Les monuments francais
//
//  Created by Snoopy on 07/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit
import MapKit

extension CarteController: CLLocationManagerDelegate {
    
    func miseEnPlace() {
        locationManager.delegate = self
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            locationManager.stopUpdatingLocation()
            let maPosition = locations[0]
            let coordonnes = maPosition.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: coordonnes, span: span)
            carte.setRegion(region, animated: true)
            
            
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    
}
