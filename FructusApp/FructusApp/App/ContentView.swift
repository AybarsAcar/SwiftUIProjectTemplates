//
//  ContentView.swift
//  FructusApp
//
//  Created by Aybars Acar on 4/12/21.
//

import SwiftUI


struct ContentView: View {

  var fruits = fruitsData.shuffled()
  
  @State private var isSettingsDisplayed: Bool = false
  
  
  var body: some View {
    
    NavigationView {
    
      List {
        ForEach(fruits) { item in
          
          NavigationLink(destination: FruitDetailView(fruit: item)){
            FruitRowView(fruit: item)
              .padding(.vertical, 4)
          }
          
        }
      }
      .navigationTitle("Fruits")
      .navigationBarItems( trailing:
        Button(action: {
          isSettingsDisplayed = true
        }, label: {
          Image(systemName: "slider.horizontal.3")
        })
          .sheet(isPresented: $isSettingsDisplayed) {
            SettingsView()
        }
      )
      
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(fruits: fruitsData)
  }
}
