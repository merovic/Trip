//
//  MapKitViewController.swift
//  Sportive
//
//  Created by Ali Mohamed on 10/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//MARK:- Map protcole
protocol CanReceive {
    func dataReceived(lat : String , long : String)
    
}

class MapKitViewController: UIViewController{
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var lat:String = ""
    var long:String = ""
    var delegate : CanReceive?
    let locationManger = CLLocationManager()
    let regionInMeters: Double = 1000000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPinToMap()
    }
    
    //-------------------------------------
    
    
    //MARK: - IBAction
    @IBAction func getLocation(_ sender: UIButton) {
        
        checkLocationIsEnabled()
        deleteAnnotation()
        
    }
    
    @IBAction func doneChoosingLocation(_ sender:
        UIButton) {
        if lat != "" , long != "" {
            delegate?.dataReceived(lat: lat, long: long)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    //----------------------------------
    
    
    //MARK: - Add Gesture Recognizer
    
    func addPinToMap(){
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(userTappedMAp))
        tapGesture.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(tapGesture)
    }
    
    //TODO: - add pin to the map wherever user tap
    @objc func userTappedMAp(sender: UIGestureRecognizer){
        if sender.state == .began {
            let locationInView = sender.location(in: mapView)
            let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
            deleteAnnotation()
            addAnnotation(location: locationOnMap)
            lat = String(locationOnMap.latitude)
            long = String(locationOnMap.longitude)
        }
    }
    
    //MARK :- Remove All Annotaions (Pins) From Map
    func deleteAnnotation() {
        self.mapView.removeAnnotations(mapView.annotations)
    }
    
    //TODO :- add mark for location
    func addAnnotation(location: CLLocationCoordinate2D){
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        self.mapView.addAnnotation(annotation)
    }
    
    
    //------------------------------------
    
    //MARK :- Set Up Core Location
    func CLLocationSetUp(){
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //MARK :- Chick If Location Is Enabled
    func checkLocationIsEnabled(){
        if CLLocationManager.locationServicesEnabled() {
            CLLocationSetUp()
            checkLocationAuthorization()
        } else {
            
        }
    }
    
    //MARK :- Get user current Location
    func centerViewOnUserLocation() {
        if let location = locationManger.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    //MARK :- Check for user authorization status
    func checkLocationAuthorization()  {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            locationManger.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManger.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    
    
    
}

//MARK :- Core Location Methodes
extension MapKitViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManger.stopUpdatingLocation()
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        lat = String(location.coordinate.latitude)
        long = String(location.coordinate.longitude)
        
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}
