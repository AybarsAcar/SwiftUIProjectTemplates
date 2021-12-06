//
//  HeadingView.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct HeadingView: View {
  
  var systemImage: String
  var heading: String
  
  var body: some View {
    
    HStack {
      Image(systemName: systemImage)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      
      Text(heading)
        .font(.title3)
        .fontWeight(.bold)
    }
    .padding(.vertical)
  }
}



struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(systemImage: "photo.on.rectangle.angled", heading: "Wilderness in Pictures")
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
