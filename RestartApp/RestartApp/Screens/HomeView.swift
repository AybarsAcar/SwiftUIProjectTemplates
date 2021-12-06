//
//  HomeView.swift
//  RestartApp
//
//  Created by Aybars Acar on 4/12/21.
//

import SwiftUI


struct HomeView: View {
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  @State private var isAnimating = false
  
  var body: some View {
   
    VStack(spacing: 20){
      // header
      Spacer()
      
      ZStack {
        
        CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
        
        Image("character-2")
          .resizable()
          .scaledToFit()
          .padding()
          .offset(y: isAnimating ? 35 : -35)
          .animation(
            .easeInOut(duration: 4).repeatForever(),
            value: isAnimating
          )
      }
      
      // center
      Text("The time that leads to mastery is dependent on the intensity of our focus.")
        .font(.title3)
        .fontWeight(.light)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .padding()
      
      // footer
      Spacer()

      Button(action: {
        // animate the navigation
        withAnimation {
          playSound("success", type: "m4a")
          isOnboardingViewActive = true
        }
        
      }, label: {
        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
          .imageScale(.large)
        
        Text("Restart")
          .font(.system(.title3, design: .rounded))
          .fontWeight(.bold)
      })
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
      
    }
    .onAppear(perform: {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
        isAnimating = true
      })
    })
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
