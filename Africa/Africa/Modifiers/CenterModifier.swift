//
//  CenterModifier.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct CenterModifier : ViewModifier {
  
  func body(content: Content) -> some View {
    
    HStack {
      Spacer()
      content
      Spacer()
    }
    
  }
  
}
