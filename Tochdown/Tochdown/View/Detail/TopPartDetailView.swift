//
//  TopPartDetailView.swift
//  Tochdown
//
//  Created by Aybars Acar on 6/12/21.
//

import SwiftUI


struct TopPartDetailView: View {
  
  @EnvironmentObject var shop: Shop
  
  @State private var isAnimating: Bool = false
  
  var body: some View {
    
    HStack(alignment: .center, spacing: 6, content: {
      
      // PRICE
      VStack(alignment: .leading, spacing: 6, content: {
        Text("Price")
          .fontWeight(.semibold)
        
        Text(shop.selectedProduct?.formattedPrice ?? Constants.sampleProduct.formattedPrice)
          .font(.largeTitle)
          .fontWeight(.black)
          .scaleEffect(1.35, anchor: .leading)
      })
        .offset(y: isAnimating ? -50 : -75)
      
      Spacer()
      
      // IMAGE
      Image(shop.selectedProduct?.image ?? Constants.sampleProduct.image)
        .resizable()
        .scaledToFit()
        .offset(y: isAnimating ? 0 : -35)
    })
      .onAppear(perform: {
        withAnimation(.easeOut(duration: 0.75)) {
          isAnimating.toggle()
        }
      })
  }
}



struct TopPartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TopPartDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
      .environmentObject(Shop())
  }
}
