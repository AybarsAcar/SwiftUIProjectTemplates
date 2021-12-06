//
//  Product.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import Foundation


struct Product: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
  let price: Int
  let description: String
  let color: [Double]
  
  var redChannel: Double { return color[0] }
  var greenChannel: Double { return color[1] }
  var blueChannel: Double { return color[2] }
  
  var formattedPrice: String { return "$\(price)" }
}
