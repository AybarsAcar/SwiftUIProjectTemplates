//
//  FruitNutrientsView.swift
//  FructusApp
//
//  Created by Aybars Acar on 4/12/21.
//

import SwiftUI


struct FruitNutrientsView: View {
  
  let nutrientTags = [
    "Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"
  ]
  
  var fruit: Fruit
  
  var body: some View {
    
    GroupBox {
      
      DisclosureGroup("Nutritional value per 100g"){
        // using the strings itself as an id
        ForEach(0..<nutrientTags.count, id: \.self) { i in
        
          Divider()
            .padding(.vertical, 2)
        
          HStack {
            Group {
              Image(systemName: "info.circle")
              Text(nutrientTags[i])
            }
            .foregroundColor(fruit.gradientColors[1])
            .font(.system(.body).bold())
            
            Spacer(minLength: 25)
            
            Text(fruit.nutrition[i])
              .multilineTextAlignment(.trailing)
          }
        }
      }
      
      
      
    }
    
    
  }
}


struct FruitNutrientsView_Previews: PreviewProvider {
  static var previews: some View {
      FruitNutrientsView(fruit: fruitsData[0])
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 375, height: 480))
        .padding()
  }
}
