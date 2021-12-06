//
//  SectionView.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct SectionView: View {
  
  var title: String
  @State var rotateClockwise: Bool
  
  var body: some View {
    
    VStack(spacing: 0 ) {
      Spacer()
      
      Text(title.uppercased())
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
      
      Spacer()
    }
    .background(Constants.colorGray.cornerRadius(12))
    .frame(width: 85)
  }
}



struct SectionView_Previews: PreviewProvider {
  static var previews: some View {
    SectionView(title: "Categories", rotateClockwise: false)
      .previewLayout(.fixed(width: 120, height: 240))
      .padding()
      .background(Constants.colorBackground)
  }
}
