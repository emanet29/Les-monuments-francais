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
    
    let urlString = "https://www.data.gouv.fr/s/resources/monuments-historiques-francais/20150408-163911/monuments.json"
    var locationManager = CLLocationManager()
    var monuments = [Monument]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carte.showsUserLocation = true
        carte.register(AnnotationVue.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        miseEnPlace()
        obtenirDonneesDepuisJSON()
    }
    
    func obtenirDonneesDepuisJSON() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else { return }
            do {
                self.monuments = try JSONDecoder().decode([Monument].self, from: data!)
                DispatchQueue.main.async {
                    self.obtenirAnnotations()
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    func obtenirAnnotations() {
        for monument in self.monuments {
            if let latitudeString = monument.latitude, let longitudeString = monument.longitude {
                if let latitude = Double(latitudeString), let longitude = Double(longitudeString) {
                    let coordonnees = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    let titre = monument.name ?? ""
                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    MonGeocoder.obtenir.adresseDepuis(location) { (adresse, erreur) -> (Void) in
                        var monAdresse = ""
                        if adresse != nil {
                            monAdresse = adresse!
                        }
                        let monAnnotation = MonAnnotation(titre: titre, adresse: monAdresse, coordonnees: coordonnees)
                        self.carte.addAnnotation(monAnnotation)
                    }
                    
                    
                    
                    
                    
                }
                
            }
            
            
        }
        
    }
    
    @IBAction func meLocaliser(_ sender: Any) {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
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
