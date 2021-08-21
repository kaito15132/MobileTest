//
//  ViewController.swift
//  MapApp2
//
//  Created by Kim Leach on 8/5/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Picker Contents
    let dataArray = ["Avondale, Arizona", "Austin, Texas", "Sacremento, California"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return dataArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = dataArray[row]
       return row
    }
    
    let mapView = MKMapView(frame: CGRect(x: 400, y: 400, width: 400, height: 400))
    let locationButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    let locationPicker = UIPickerView()
    let locationManager = CLLocationManager()
    
    let azRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.4353, longitude: -112.3577), latitudinalMeters: 50000, longitudinalMeters: 50000)
    let txRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:  30.2672, longitude: -97.7431), latitudinalMeters: 50000, longitudinalMeters: 50000)
    let caRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.5816, longitude: -121.4944), latitudinalMeters: 50000, longitudinalMeters: 50000)
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view = UIView()
        view.backgroundColor = .white
        
        setupMapView()
        setupPickerView()
        setupLocationButton()
        
        
    }
    
    func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
        }
    
    func setupPickerView() {
        locationPicker.delegate = self as UIPickerViewDelegate
        locationPicker.dataSource = self as UIPickerViewDataSource
        self.view.addSubview(locationPicker)
        locationPicker.translatesAutoresizingMaskIntoConstraints = false
        locationPicker.topAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        locationPicker.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
    }
    
    func setupLocationButton() {
        self.view.addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.backgroundColor = .green
        locationButton.setTitle("Change Location", for: .normal)
        locationButton.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        locationButton.topAnchor.constraint(equalTo: locationPicker.bottomAnchor).isActive = true
        locationButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
    }
    
    @objc func buttonAction(sender: UIButton!) {
        switch(locationPicker.selectedRow(inComponent: 0))
        {
        case 0:
            print("Arizona")
            mapView.setRegion(azRegion, animated: true)
        case 1:
            print("Tex")
            mapView.setRegion(txRegion, animated: true)
        case 2:
            print("Cali")
            mapView.setRegion(caRegion, animated: true)
        default:
            print("default")
        }
    }
}

