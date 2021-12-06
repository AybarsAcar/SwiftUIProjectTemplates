//
//  QuantityFavouriteDetailView.swift
//  Tochdown
//
//  Created by Aybars Acar on 6/12/21.
//

import SwiftUI


struct QuantityFavouriteDetailView: View {
  
  @State private var counter: Int = 0
  @State private var isLiked: Bool = false
  
  var body: some View {
    
    HStack(alignment: .center, spacing: 6) {
      
      Button(action: {
        Constants.feedback.impactOccurred()
        if counter > 0 {
          counter -= 1
        }
        
      }, label: {
        Image(systemName: "minus.circle")
      })
      
      Text("\(counter)")
        .fontWeight(.semibold)
        .frame(minWidth: 36)
      
      Button(action: {
        Constants.feedback.impactOccurred()
        counter += 1
      }, label: {
        Image(systemName: "plus.circle")
      })
      
      Spacer()
      
      Button(action: {
        Constants.feedback.impactOccurred()
        isLiked.toggle()
      }, label: {
        Image(systemName: "heart.circle")
          .foregroundColor(isLiked ? .pink : Constants.colorGray)
      })
      
    }
    .font(.system(.title, design: .rounded))
    .foregroundColor(.black)
    .imageScale(.large)
  }
}



struct QuantityFavouriteDetailView_Previews: PreviewProvider {
  static var previews: some View {
    QuantityFavouriteDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
