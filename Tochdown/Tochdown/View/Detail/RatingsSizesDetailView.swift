//
//  RatingsSizesDetailView.swift
//  Tochdown
//
//  Created by Aybars Acar on 6/12/21.
//

import SwiftUI

struct RatingsSizesDetailView: View {
  
  let sizes = [
    "XS", "S", "M", "L", "XL"
  ]
  
  
  var body: some View {
    
    HStack(alignment: .top, spacing: 3) {
      
      // Ratings
      VStack(alignment: .leading, spacing: 3, content: {
        Text("Ratings")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(Constants.colorGray)
        
        HStack(alignment: .center, spacing: 3, content: {
          ForEach(1...5, id: \.self) {item in
            Button(action: {}, label: {
              Image(systemName: "star.fill")
                .frame(width: 28, height: 28, alignment: .center)
                .background(Constants.colorGray.cornerRadius(5))
                .foregroundColor(.white)
            })
          }
        })
      })
      
      Spacer()
      
      // Sizes
      VStack(alignment: .trailing, spacing: 3, content: {
        Text("Sizes")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(Constants.colorGray)
        
        HStack (alignment: .center, spacing: 5) {
          ForEach(sizes, id: \.self) {item in
            Button(action: {}, label: {
              Text(item)
                .font(.footnote)
                .fontWeight(.heavy)
                .foregroundColor(Constants.colorGray)
                .frame(width: 28, height: 28, alignment: .center)
                .background(Color.white.cornerRadius(5))
                .background(
                  RoundedRectangle(cornerRadius: 5)
                    .stroke(Constants.colorGray, lineWidth: 2)
                )
            })
          }
        }
      })
      
    }
  }
}

struct RatingsSizesDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RatingsSizesDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
