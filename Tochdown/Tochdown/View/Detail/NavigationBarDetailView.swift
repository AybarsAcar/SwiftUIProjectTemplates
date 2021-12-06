//
//  NavigationBarDetailView.swift
//  Tochdown
//
//  Created by Aybars Acar on 6/12/21.
//

import SwiftUI


struct NavigationBarDetailView: View {
  
  @EnvironmentObject var shop: Shop
  
  var body: some View {
    
    HStack {
      
      Button(action: {
        Constants.feedback.impactOccurred()
        withAnimation(.easeIn) {
          shop.selectedProduct = nil
          shop.showingProduct = false
        }
      }, label: {
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      })
      
      Spacer()
      
      Button(action: {
      
      }, label: {
        Image(systemName: "cart")
          .font(.title2)
          .foregroundColor(.white)
      })
    }
  }
}



struct NavigationBarDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color.gray)
  }
}
