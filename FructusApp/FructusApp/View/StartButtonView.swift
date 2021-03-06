//
//  StartButtonView.swift
//  FructusApp
//
//  Created by Aybars Acar on 4/12/21.
//

import SwiftUI


struct StartButtonView: View {
  
  @AppStorage("isOnboarding") var isOnboarding: Bool?
  
  var body: some View {
    
    Button(action: {
      isOnboarding = false
      
    }, label: {
      
      HStack(spacing: 8) {
        Text("Start")
        
        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(
        Capsule()
          .strokeBorder(.white, lineWidth: 1.25)
      )
      
    })
      .accentColor(.white)
    
  }
  
}


struct StartButtonView_Previews: PreviewProvider {
  static var previews: some View {
  
    StartButtonView()
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)

  }
}
