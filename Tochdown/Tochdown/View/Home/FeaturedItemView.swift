//
//  FeaturedItemView.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct FeaturedItemView: View {
  
  let player: Player
  
  var body: some View {
    
    Image(player.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}



struct FeaturedItemView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedItemView(player: Constants.players[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Constants.colorBackground)
  }
}
