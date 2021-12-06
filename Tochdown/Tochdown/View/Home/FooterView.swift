//
//  FooterView.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct FooterView: View {
  
  var body: some View {
    
    VStack(alignment: .center, spacing: 10) {
      Text("We offer the most cutting edge, comfortable, lightweight, and durable footaball helmets in the market at affordable prices.")
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(2)
      
      Image("logo-lineal")
        .renderingMode(.template)
        .foregroundColor(.gray)
        .layoutPriority(0)
      
      Text("Copyright © Aybars Acar\nAll rights reserved")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(1)
    }
  }
}



struct FooterView_Preview: PreviewProvider {
  static var previews: some View {
    FooterView()
      .previewLayout(.sizeThatFits)
      .background(Constants.colorBackground)
  }
}
