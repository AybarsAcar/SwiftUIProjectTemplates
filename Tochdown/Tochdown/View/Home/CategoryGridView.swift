//
//  CategoryGridView.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct CategoryGridView: View {
  
  var body: some View {
    
    ScrollView(.horizontal, showsIndicators: false) {
      
      LazyHGrid(
        rows: Constants().gridLayout,
        alignment: .center,
        spacing: Constants.columnSpacing,
        content: {
          Section(
            header: SectionView(title: "Categories", rotateClockwise: false),
            footer: SectionView(title: "Categories", rotateClockwise: true)
          ) {
            ForEach(Constants.categories) { category in
              CategoryItemView(category: category)
            }
          }
        })
        .frame(height: 140)
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
  }
}



struct CategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryGridView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Constants.colorBackground)
  }
}
