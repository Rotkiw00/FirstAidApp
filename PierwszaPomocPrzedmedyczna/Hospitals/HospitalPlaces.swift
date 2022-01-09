//
//  HospitalPlaces.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 05/12/2021.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longtitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
    }
    let phoneNum: String
}
