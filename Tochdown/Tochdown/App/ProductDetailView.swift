//
//  ProductDetailView.swift
//  Tochdown
//
//  Created by Aybars Acar on 6/12/21.
//

import SwiftUI

struct ProductDetailView: View {
  
  @EnvironmentObject var shop: Shop
  
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 5) {
      
      // NAVBAR
      NavigationBarDetailView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
      
      // HEADER
      HeaderDetailView()
        .padding(.horizontal)
      
      // DETAIL TOP PART
      TopPartDetailView()
        .padding(.horizontal)
        .zIndex(1)
      
      // DETAIL BOTTOM PART
      VStack(alignment: .center, spacing: 0) {
        
        // RATINGS + SIZES
        RatingsSizesDetailView()
          .padding(.top, -20)
          .padding(.bottom, 10)
        
        // DESCRIPTION
        ScrollView(.vertical, showsIndicators: false) {
          Text(shop.selectedProduct?.description ?? Constants.sampleProduct.description)
            .font(.system(.body, design: .rounded))
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
        }
        
        // QUANTITY + FAVOURITE
        QuantityFavouriteDetailView()
          .padding(.vertical, 10)
        
        // ADD TO CART
        AddToCartDetailView()
          .padding(.bottom, 20)
      }
      .padding(.horizontal)
      .background(Color.white.clipShape(CustomShape()).padding(.top, -100))
      
      
      
      
    }
    .zIndex(0)
    .ignoresSafeArea(.all, edges: .all)
    .background(
      Color(
        red: shop.selectedProduct?.redChannel ?? Constants.sampleProduct.redChannel,
        green: shop.selectedProduct?.greenChannel ?? Constants.sampleProduct.greenChannel,
        blue: shop.selectedProduct?.blueChannel ?? Constants.sampleProduct.blueChannel
      )
        .ignoresSafeArea(.all, edges: .all)
    )
  }
}



struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView()
      .previewLayout(.fixed(width: 375, height: 812))
      .environmentObject(Shop())
  }
}
