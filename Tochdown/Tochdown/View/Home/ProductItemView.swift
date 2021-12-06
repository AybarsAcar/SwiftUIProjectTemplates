//
//  ProductItem.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct ProductItemView: View {
  
  let product: Product
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 6) {
      
      // Photo
      ZStack {
        Image(product.image)
          .resizable()
          .scaledToFit()
          .padding(10)
      }
      .background(Color(red: product.redChannel, green: product.greenChannel, blue: product.blueChannel))
      .cornerRadius(12)
          
      // Name
      Text(product.name)
        .font(.title2)
        .fontWeight(.black)
      
      // Price
      Text(product.formattedPrice)
        .fontWeight(.semibold)
        .foregroundColor(.gray)
      
    }
  }
}



struct ProductItem_Previews: PreviewProvider {
  static var previews: some View {
    ProductItemView(product: Constants.products[0])
      .previewLayout(.fixed(width: 200, height: 300))
      .padding()
      .background(Constants.colorBackground)
  }
}
