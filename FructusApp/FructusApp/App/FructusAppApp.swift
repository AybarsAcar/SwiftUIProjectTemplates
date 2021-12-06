//
//  FructusAppApp.swift
//  FructusApp
//
//  Created by Aybars Acar on 4/12/21.
//

import SwiftUI


@main
struct FructusAppApp: App {
  
  @AppStorage("isOnboarding") var isOnboarding = true
  
  var body: some Scene {
    WindowGroup {
      if isOnboarding {
        OnboardingView()
      } else {
        ContentView()
      }
    }
  }
}
