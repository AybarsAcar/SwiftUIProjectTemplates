//
//  BrandItemView.swift
//  Tochdown
//
//  Created by Aybars Acar on 6/12/21.
//

import SwiftUI


struct BrandItemView: View {
  
  var brand: Brand
  
  var body: some View {
    Image(brand.image)
      .resizable()
      .scaledToFit()
      .padding()
      .background(Color.white.cornerRadius(12))
      .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
  }
}



struct BrandItemView_Previews: PreviewProvider {
  static var previews: some View {
    BrandItemView(brand: Constants.brands[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Constants.colorBackground)
  }
}
