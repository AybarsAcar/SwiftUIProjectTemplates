//
//  BrandGridView.swift
//  Tochdown
//
//  Created by Aybars Acar on 6/12/21.
//

import SwiftUI


struct BrandGridView: View {
  var body: some View {

    ScrollView(.horizontal, showsIndicators: false) {
      
      LazyHGrid(rows: Constants().gridLayout, spacing: Constants.columnSpacing) {
        ForEach(Constants.brands) { brand in
          BrandItemView(brand: brand)
        }
      }
      .frame(height: 200)
      .padding()
    }
  }
}



struct BrandGridView_Previews: PreviewProvider {
  static var previews: some View {
    BrandGridView()
      .previewLayout(.sizeThatFits)
      .background(Constants.colorBackground)
  }
}
