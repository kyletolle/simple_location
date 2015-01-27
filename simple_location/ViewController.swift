//
//  ViewController.swift
//  simple_location
//
//  Created by Kyle Tolle on 1/26/15.
//  Copyright (c) 2015 Kyle Tolle. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.delegate        = self
        self.locationManager.distanceFilter  = kCLDistanceFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnWhereAmI(sender: UIButton) {
        var latitudeString = NSString(format: "Latitude: %0.4f", self.locationManager.location.coordinate.latitude)
        lblLatitude.text   = latitudeString
        
        var longitudeString = NSString(format: "Longitude: %0.4f", self.locationManager.location.coordinate.longitude)
        lblLongitude.text   = longitudeString
    }
    
    @IBAction func btnClear(sender: UIButton) {
        lblLatitude.text  = "Latitude"
        lblLongitude.text = "Longitude"
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var dCurrentLatitude  : Double = locations[0].coordinate.latitude
        var dCurrentLongitude : Double = locations[0].coordinate.longitude
        
        var latitudeString = NSString(format: "Latitude: %0.4f", dCurrentLatitude)
        lblLatitude.text   = latitudeString
        
        var longitudeString = NSString(format: "Longitude: %0.4f", dCurrentLongitude)
        lblLongitude.text   = longitudeString
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        lblLatitude.text = "Can't get your location!"
    }

}

