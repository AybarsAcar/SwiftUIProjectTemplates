//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Aybars Acar on 4/12/21.
//

import SwiftUI


struct OnboardingView: View {
  
  let buttonSize: CGFloat = 80
  
  let hapticFeedback = UINotificationFeedbackGenerator()
  
  @AppStorage("onboarding") var isOnboardingActive: Bool = true
  
  // get the device screen width
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0
  
  // animation variables
  @State private var isAnimating = false
  @State private var imageOffSet: CGSize = CGSize(width: 0, height: 0)
  @State private var indicatorOpacity: Double = 1.0
  @State private var textTitle: String = "Share."
  
  
  var body: some View {
    
    ZStack {
      
      // set the background color
      Color("ColorBlue")
        .ignoresSafeArea(.all, edges: .all)
      
      
      VStack(spacing: 20) {
       
        Spacer()
        
        VStack(spacing: 0){
    
          Text(textTitle)
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .transition(.opacity)
            .id(textTitle) // add a unique id so we can tell SwiftUI that the view has changed to trigger String animations
          
          Text("""
            It's not how much we give but
            how much love we put into giving.
            """)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
        }
        .opacity(isAnimating ? 1 : 0) // update the opacity
        .offset(y: isAnimating ? 0 : -40) // update the y translation
        .animation(.easeOut(duration: 1), value: isAnimating) // interpolation of the value change
        
        ZStack {
         
          CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
            .offset(x: imageOffSet.width * -1)
            .blur(radius: abs(imageOffSet.width / 5))
            .animation(.easeOut(duration: 1), value: imageOffSet) // animate as the image OffSet Changes
          
          Image("character-1")
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 0.5), value: isAnimating)
            .offset(x: imageOffSet.width * 1.2, y: 0)
            .rotationEffect(.degrees(Double(imageOffSet.width / 20))) // add rotation to the image
            .gesture(
              DragGesture()
                .onChanged{ gesture in
                  if abs(imageOffSet.width) <= 150 {
                    imageOffSet = gesture.translation
                    
                    // hide the indicator as user drags
                    withAnimation(.linear(duration: 0.25)){
                      indicatorOpacity = 0
                      textTitle = "Give."
                    }
                  }
                }
                .onEnded { _ in
                  imageOffSet = .zero
                  
                  // display the indicator as user stops dragging
                  withAnimation(.linear(duration: 0.25)){
                    indicatorOpacity = 1
                    textTitle = "Share."
                  }
                }
            )
            .animation(.easeOut(duration: 1), value: imageOffSet)
        }
        .overlay(
          Image(systemName: "arrow.left.and.right.circle")
            .font(.system(size: 44, weight: .ultraLight))
            .foregroundColor(.white)
            .offset(y: 20)
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
            .opacity(indicatorOpacity),
          alignment: .bottom
        )
        
        Spacer()
        
        ZStack {
          
          // background
          Capsule()
            .fill(Color.white.opacity(0.2))
          
          Capsule()
            .fill(Color.white.opacity(0.2))
            .padding(8)
          
          // call to action
          Text("Get Started")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 20)
          
          // capsule dynamic width
          HStack{
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: buttonOffset + buttonSize)
            
            Spacer()
          }
          
          HStack {
            ZStack {
              Circle().fill(Color("ColorRed"))
              
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24, weight: .bold))
              
            }
            .foregroundColor(.white)
            .frame(width: buttonSize, height: buttonSize, alignment: .center)
            .offset(x: buttonOffset)
            .gesture(
              DragGesture()
                .onChanged { gesture in // pass in the gesture into the lambda
                
                  if gesture.translation.width > 0 && buttonOffset <= buttonWidth - buttonSize {
                    // move the button as we drag
                    buttonOffset = gesture.translation.width
                  }
                }
                .onEnded { _ in
                  // snap back feature
                  // add animation to the transition
                  withAnimation(Animation.easeOut(duration: 0.4)) {
                    if buttonOffset > buttonWidth / 2 {
                      
                      hapticFeedback.notificationOccurred(.success)
                      
                      playSound("chimeup", type: "mp3")
                      
                      buttonOffset = buttonWidth - buttonSize
                      isOnboardingActive = false // navigate
                      
                    } else {
                      hapticFeedback.notificationOccurred(.warning)
                      buttonOffset = 0
                    }
                  }
                }
            )
            
            Spacer()
          }
        }
        .frame(width: buttonWidth, height: buttonSize, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(.easeOut(duration: 1), value: isAnimating)
      }
    }
    .onAppear(perform: {
      isAnimating = true
    })
    .preferredColorScheme(.dark)
  }
}


struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      OnboardingView()
    }
  }
}
