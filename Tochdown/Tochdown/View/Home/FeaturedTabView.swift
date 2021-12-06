//
//  FeaturedTabView.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct FeaturedTabView: View {
  
  var body: some View {
    
    TabView {
      
      ForEach(Constants.players) { player in
        FeaturedItemView(player: player)
          .padding(.top, 10)
          .padding(.horizontal, 15)
      }
      
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
}



struct FeaturedTabView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedTabView()
      .previewDevice("iPhone 13 Pro Max")
      .background(Color.gray)
  }
}
