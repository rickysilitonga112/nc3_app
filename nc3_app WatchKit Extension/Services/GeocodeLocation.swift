//
//  GeocodeLocation.swift
//  nc3_app WatchKit Extension
//
//  Created by Andika Rizki Pradana on 21/07/22.
//

import Foundation
import CoreLocation

class CLGeocoder : NSObject {
	func reverseGeocodeLocation(
		_ location: CLLocation,
		completionHandler: @escaping CLGeocodeCompletionHandler
	) {
		
		// Print and convert coordinate to city name
		
	}
}

//var locationManager = LocationManager()
//
//let geoCoder = CLGeocoder()
//
//let userLatitude = locationManager.lastLocation?.coordinate.latitude ?? 0
//let userLongitude = locationManager.lastLocation?.coordinate.longitude ?? 0
//
//let location = CLLocation(latitude: userLatitude, longitude: userLongitude)
//
//geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) -> Void in
//
//	placemarks?.forEach { (placemark) in
//
//		if let city = placemark.locality { print(city) }
//	}
//})

