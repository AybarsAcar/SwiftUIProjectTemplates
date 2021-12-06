//
//  Location.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import Foundation
import MapKit


struct NationalParkLocation : Identifiable, Codable {
  
  let id: String
  let name: String
  let image: String
  let latitude: Double
  let longitude: Double
  
  
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
