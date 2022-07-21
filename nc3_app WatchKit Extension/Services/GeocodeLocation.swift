//
//  GeocodeLocation.swift
//  nc3_app WatchKit Extension
//
//  Created by Andika Rizki Pradana on 21/07/22.
//

import Foundation
import CoreLocation

extension CLLocation {
	func fetchCityName(completion: @escaping (_ city: String?, _ error: Error?) -> ()) {
		CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $1) }
	}
}


