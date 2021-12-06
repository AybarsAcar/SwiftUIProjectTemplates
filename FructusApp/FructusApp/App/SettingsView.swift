//
//  SettingsView.swift
//  FructusApp
//
//  Created by Aybars Acar on 4/12/21.
//

import SwiftUI


struct SettingsView: View {
  
  @Environment(\.presentationMode) var presentationMode
  
  @AppStorage("isOnboarding") var isOnboarding = false
 
  var body: some View {
    
    NavigationView {
      
      ScrollView(.vertical, showsIndicators: false) {
        
        VStack(spacing: 20) {
        
          // SECTION 1
          GroupBox(
            label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
          ) {
            Divider().padding(.vertical, 4)
            
            HStack(alignment: .center, spacing: 10) {
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(9)
              
              Text("Most fruits are natuarally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more")
                .font(.footnote)
            }
          }
          
          // SECTION 2
          GroupBox(
            label: SettingsLabelView(labelText: "Customisation", labelImage: "paintbrush")
          ) {
            Divider().padding(.vertical, 4)
            
            Text("If you wish you can restart the application by togglint the switch in this box. That way it starts the onboarding process and you will see the welcome screen again")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)
            
            Toggle(isOn: $isOnboarding, label: {
              if isOnboarding {
                Text("Restarted".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.green)
              } else {
                Text("Restart".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.secondary)
              }
            })
              .padding()
              .background(
                Color(UIColor.tertiarySystemBackground)
                  .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
              )
          }
          
          // SECTION 3
          GroupBox(
            label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
          ) {
            
            SettingsRowView(name: "Software Engineer", content: "Aybars Acar")
            SettingsRowView(name: "Compatibility", content: "iOS 14")
            SettingsRowView(name: "Website", linkLabel: "Personal Website", linkDestination: "aybarsacar.dev")
            SettingsRowView(name: "LinkedIn", linkLabel: "@aybars.acar", linkDestination: "linkedin.com")
            
          }
          
        }
        .padding()
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems( trailing:
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "xmark")
          })
        )
        
      }
      
    }
  }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 13 Pro Max")
    }
}
