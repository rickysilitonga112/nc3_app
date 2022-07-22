//
//  GeocodeLocation.swift
//  nc3_app WatchKit Extension
//
//  Created by Andika Rizki Pradana on 21/07/22.
//

import Foundation
import CoreLocation

extension CLLocation {
    func geocode(completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}

