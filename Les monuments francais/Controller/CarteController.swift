//
//  CarteController.swift
//  Les monuments francais
//
//  Created by Snoopy on 07/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit
import MapKit

class CarteController: UIViewController {
    
    @IBOutlet weak var carte: MKMapView!
    @IBOutlet weak var maPositionBouton: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func meLocaliser(_ sender: Any) {
        
    }
    
    @IBAction func segmentChoisi(_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0: carte.mapType = .standard
        case 1: carte.mapType = .satellite
        case 2: carte.mapType = .hybrid
        default:
            break
        }
    }
}
