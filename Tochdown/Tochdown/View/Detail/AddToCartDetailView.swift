//
//  AddToCartDetailView.swift
//  Tochdown
//
//  Created by Aybars Acar on 6/12/21.
//

import SwiftUI

struct AddToCartDetailView: View {
  
  @EnvironmentObject var shop: Shop
  
  var body: some View {
    
    Button(action: {
      Constants.feedback.impactOccurred()
    }, label: {
      Spacer()
      
      Text("Add to cart".uppercased())
        .font(.system(.title2, design: .rounded))
        .fontWeight(.bold)
        .foregroundColor(.white)
      
      Spacer()
    })
      .padding(15)
      .background(
        Color(
          red: shop.selectedProduct?.redChannel ?? Constants.sampleProduct.redChannel,
          green: shop.selectedProduct?.greenChannel ?? Constants.sampleProduct.greenChannel,
          blue: shop.selectedProduct?.blueChannel ?? Constants.sampleProduct.blueChannel
        )
      )
      .clipShape(Capsule())
  }
}

struct AddToCartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AddToCartDetailView()
      .previewLayout(.sizeThatFits)
      .environmentObject(Shop())
      .padding()
  }
}
