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
    
    // MARK: - Properties
    var viewModel: MapTableViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            configMap(lat: viewModel.lat, lon: viewModel.lon)
        }
    }
    
    // MARK: - Private functions
    private func configMap(lat: Double, lon: Double) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        mapView.setCenter(annotation.coordinate, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: annotation.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false
    }
}
