//
//  CreditsView.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct CreditsView: View {
  var body: some View {
    
    HStack {
      
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 64, height: 64, alignment: .center)
      
      Text("""
  Copyright © Aybars Acar
  All rights reserved
  UGL Limited
  """)
        .font(.footnote)
      .multilineTextAlignment(.leading)
    }
    .padding()
    .opacity(0.6)
  }
}



struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
