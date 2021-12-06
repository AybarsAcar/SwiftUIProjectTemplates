//
//  NavigationBarView.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct NavigationBarView: View {
  
  @State private var hasAnimated = false
  
  var body: some View {
    HStack {
      Button(action: {
        
      }, label: {
        Image(systemName: "magnifyingglass")
          .font(.title)
          .foregroundColor(.black)
      })
      
      Spacer()
      
      LogoView()
        .opacity(hasAnimated ? 1 : 0)
        .offset(x: 0, y: hasAnimated ? 0 : -25)
        .onAppear {
          withAnimation(.easeOut(duration: 0.5)){
            hasAnimated.toggle()
          }
        }
      
      Spacer()
      
      Button(action: {
        
      }, label: {
        ZStack {
          Image(systemName: "cart")
            .font(.title)
            .foregroundColor(.black)
          
          Circle()
            .fill(Color.red)
            .frame(width: 14, height: 14, alignment: .center)
            .offset(x: 13, y: -10)
        }
      })
    }
  }
}

struct NavigationBarView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
