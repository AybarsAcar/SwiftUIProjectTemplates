//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct AnimalDetailView: View {
  
  let animal: Animal
  
  var body: some View {
    
    ScrollView(.vertical, showsIndicators: false) {
    
      VStack(alignment: .center, spacing: 20) {
        
        // HERO
        Image(animal.image)
          .resizable()
          .scaledToFit()
        
        // TITLE
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundColor(.primary)
          .background(
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )
        
        // HEADLINE
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)
        
        // GALLERY
        Group {
          HeadingView(systemImage: "photo.on.rectangle.angled", heading: "Wilderness in Pictures")
          InsetGalleryView(animal: animal)
        }
        .padding(.horizontal)
        
        // FACTS
        Group {
          HeadingView(systemImage: "questionmark.circle", heading: "Did you know?")
          InsetFactView(animal: animal)
        }
        .padding(.horizontal)
        
        // DESCRIPTION
        Group {
          HeadingView(systemImage: "info.circle", heading: "All about \(animal.name)")
          
          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal)
        
        // MAP
        Group {
          HeadingView(systemImage: "map", heading: "National Parks")
          InsetMapView()
        }
        .padding(.horizontal)
        
        // LINK
        Group {
          HeadingView(systemImage: "books.vertical", heading: "Learn More")
          ExternalWebLinkView(animal: animal)
        }
        .padding(.horizontal)

      }
      .navigationBarTitle("Learn about \(animal.name)s", displayMode: .inline)
      
    }
    
  }
}



struct AnimalDetailView_Previews: PreviewProvider {
  
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
    static var previews: some View {
      NavigationView {
        AnimalDetailView(animal: animals[3])
      }
    }
}
