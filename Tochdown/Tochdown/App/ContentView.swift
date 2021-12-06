//
//  ContentView.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct ContentView: View {
  
  @EnvironmentObject var shop: Shop
  
  var body: some View {
    
    ZStack {
      
      if shop.showingProduct == false && shop.selectedProduct == nil {
        VStack(spacing: 0) {
        
        NavigationBarView()
          .padding()
          .background(.white)
          .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
        
        ScrollView (.vertical, showsIndicators: false) {
          
          VStack(spacing: 0) {
            
            FeaturedTabView()
              .padding(.vertical, 20)
              .frame(height: UIScreen.main.bounds.width / 1.475)
            
            CategoryGridView()
            
            TitleView(title: "Helmets")
            
            LazyVGrid(columns: Constants().gridLayout, spacing: 15) {
              ForEach(Constants.products) { product in
                ProductItemView(product: product)
                  .onTapGesture {
                    Constants.feedback.impactOccurred()
                    withAnimation(.easeOut) {
                      shop.selectedProduct = product
                      shop.showingProduct = true
                    }
                  }
              }
            }
            .padding(15)
            
            
            TitleView(title: "Brands")
            BrandGridView()
            
            FooterView()
              .padding(.horizontal)
          }
          
        }
        
      }
        .background(Constants.colorBackground.ignoresSafeArea(.all, edges: .all))
        
      } else {
        
        ProductDetailView()
      }
    }
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(Shop())
  }
}
