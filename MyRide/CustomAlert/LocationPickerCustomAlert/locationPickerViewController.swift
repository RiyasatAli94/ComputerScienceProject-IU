//
//  locationPickerViewController.swift
//  MyRide
//
//  Created by Keval Shah on 01/04/23.
//

import UIKit
import MapKit
import CoreLocation
import LocationPicker

class locationPickerViewController: UIViewController {
    
    @IBOutlet weak var title_lbl: UILabel!
    
    @IBOutlet weak var save_btn: UIButton!
    @IBOutlet weak var maps_view: UIView!
    var locationManager: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        save_btn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // determineCurrentLocation()
        //loca()
    }
    override func viewWillAppear(_ animated: Bool) {
        //loca()
    }
    
  
    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation()
            }
        }
    }
   

    @IBAction func searchBtn(_ sender: Any) {
        loca()
    }
    
    @IBAction func back_btn(_ sender: Any) {
        ScreensManager.shared.Dashboard(on: self,modal: true,animated: false)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
    }
}

extension locationPickerViewController{
    func loca(){
        let locationPicker = LocationPickerViewController()

        // you can optionally set initial location
        let location = CLLocation(latitude: 35, longitude: 35)
        let placeName = "Some name"
//        let initialLocation = Location(name: "My home", location: location, placemark: location. )
//        locationPicker.location = initialLocation

        // button placed on right bottom corner
        locationPicker.showCurrentLocationButton = true // default: true

        // default: navigation bar's `barTintColor` or `UIColor.white`
        locationPicker.currentLocationButtonBackground = .blue

        // ignored if initial location is given, shows that location instead
        locationPicker.showCurrentLocationInitially = true // default: true

        locationPicker.mapType = .standard // default: .Hybrid

        // for searching, see `MKLocalSearchRequest`'s `region` property
        locationPicker.useCurrentLocationAsHint = true // default: false

        locationPicker.searchBarPlaceholder = "Search places" // default: "Search or enter an address"

        locationPicker.searchHistoryLabel = "Previously searched" // default: "Search History"

        // optional region distance to be used for creation region when user selects place from search results
        locationPicker.resultRegionDistance = 500 // default: 600

        locationPicker.completion = { location in
            // do some awesome stuff with location
        }

        //present(locationPicker, animated: true)
        navigationController?.present(locationPicker, animated: true)
    }
}

extension locationPickerViewController: MKMapViewDelegate, CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let mUserLocation:CLLocation = locations[0] as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        //maps_view.setRegion(mRegion, animated: true)
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(mUserLocation.coordinate.latitude, mUserLocation.coordinate.longitude);
        myAnnotation.title = "Current location"
        //maps_view.addAnnotation(myAnnotation)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error - locationManager: \(error.localizedDescription)")
    }
}
