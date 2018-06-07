//
//  AnnotationVue.swift
//  Les monuments francais
//
//  Created by Snoopy on 07/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit
import MapKit

class AnnotationVue: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let nouvelle = newValue as? MonAnnotation else { return }
            image = #imageLiteral(resourceName: "Group")
            
            
        }
    }
    
}
