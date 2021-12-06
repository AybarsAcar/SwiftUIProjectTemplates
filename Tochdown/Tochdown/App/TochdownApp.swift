//
//  TochdownApp.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI

@main
struct TochdownApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(Shop())
    }
  }
}
