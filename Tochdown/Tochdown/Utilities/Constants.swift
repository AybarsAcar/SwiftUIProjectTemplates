//
//  Constants.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct Constants {
  
  // COLORS
  static let colorBackground = Color("ColorBackground")
  static let colorGray = Color(UIColor.systemGray4)

  
  // DATA
  static let players: [Player] = Bundle.main.decode("player.json")
  static let categories: [Category] = Bundle.main.decode("category.json")
  static let products: [Product] = Bundle.main.decode("product.json")
  static let brands: [Brand] = Bundle.main.decode("brand.json")
  static let sampleProduct: Product = products[0]
  
  
  // LAYOUT
  static let columnSpacing: CGFloat = 10
  static let rowSpacing: CGFloat = 10
  let _rowSpacing: CGFloat = 10
  var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: _rowSpacing), count: 2)
  }
  
  // UX
  static let feedback = UIImpactFeedbackGenerator(style: .medium)
  
}

