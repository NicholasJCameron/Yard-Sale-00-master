//
//  HavingViewController.swift
//  Yard Sale 00
//
//  Created by Nick J Cameron on 2016-09-01.
//  Copyright © 2016 Nick J Cameron. All rights reserved.
//

import UIKit
import MapKit
import AddressBook
import CoreLocation


class HavingViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate{
    @IBOutlet weak var MapView: MKMapView!

    
    @IBOutlet weak var lblLocation: UILabel!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
      
        

        
        
        //BELOW IS GETTING THE MAP INFORMATION (MAP START)
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            let locValue:CLLocationCoordinate2D = locationManager.location!.coordinate
            print("locations = \(locValue.latitude) \(locValue.longitude)")
          
            
            

            
            
            let geocoder = CLGeocoder()
            let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
            geocoder.reverseGeocodeLocation(location) {
                (placemarks, error) -> Void in
                let placemarks = placemarks! as [CLPlacemark]
                if  placemarks.count > 0 {
                    let placemark = placemarks[0]
                    print(placemark.addressDictionary)
                    
                    let locationName = placemark.addressDictionary?["Name"] as? NSString
                    
                    let city = placemark.addressDictionary?["City"] as? NSString
                  
                    
                    self.lblLocation.text = (locationName as String?)! + ", " +  (city as String?)! ;
                
                   
                    self.centerMapOnLocation(location: location)

                    
                    let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(locValue.latitude, locValue.longitude)
                  

                    let objectAnnotation = MKPointAnnotation()
                    objectAnnotation.coordinate = pinLocation
                    objectAnnotation.title = "Your Sale"
                    self.MapView.addAnnotation(objectAnnotation)
                    
                    
//THE NAME OF THE STREET IS ABOVE
                    
                    
                }
            }
        }
            /////(MAP END)
            
        
        
        
        // Do any additional setup after loading the view.
    }

    
    
    
    
    
    private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
    
    
    let regionRadius: CLLocationDistance = 300
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        MapView.setRegion(coordinateRegion, animated: true)
    }
    

    // pinColor for disciplines: Sculpture, Plaque, Mural, Monument, other
//    func pinColor() -> MKPinAnnotationColor  {
//        switch discipline {
//        case "Sculpture", "Plaque":
//            return .Red
//        case "Mural", "Monument":
//            return .Purple
//        default:
//            return .Green
//        }
//    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
