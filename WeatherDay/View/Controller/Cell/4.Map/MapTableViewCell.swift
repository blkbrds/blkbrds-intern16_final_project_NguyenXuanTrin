//
//  MapTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/1/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit
import MapKit

final class MapTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        configMap()
        mapView.mapType = MKMapType.satellite
    }
    
    // MARK: - Private functions
    private func configMap() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 16.054407, longitude: 108.202164)
        mapView.setCenter(annotation.coordinate, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: annotation.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}
