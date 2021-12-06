//
//  GalleryView.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct GalleryView: View {
  
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var selectedAnimalImage: String = "lion"
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  
  // Grid Definition
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }
  
  
  var body: some View {

    ScrollView(.vertical, showsIndicators: false) {
      
      VStack(alignment: .center, spacing: 30) {
        
        // Image
        Image(selectedAnimalImage)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 1))
        
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
          })
        
        // Grid Layout
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          
          ForEach(animals) { animal in
            Image(animal.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                haptics.impactOccurred()
                selectedAnimalImage = animal.image
              }
          }
        }
        .animation(.easeIn)
        .onAppear(perform: {
          gridSwitch()
        })
        
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
      
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
    
  }
}



struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
