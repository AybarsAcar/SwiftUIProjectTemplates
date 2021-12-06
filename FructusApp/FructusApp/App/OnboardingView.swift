//
//  OnboardingView.swift
//  FructusApp
//
//  Created by Aybars Acar on 4/12/21.
//

import SwiftUI


struct OnboardingView: View {
  
  var fruits = fruitsData
  
  var body: some View {
    
    TabView {
      
      ForEach(0..<fruits.count){ item in
        
        FruitCardView(fruit: fruits[item])
        
      }
    
    }
    .tabViewStyle(PageTabViewStyle())
    .padding(.vertical, 20)
    
  }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
