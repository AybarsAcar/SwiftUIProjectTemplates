//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI
import AVKit


struct VideoPlayerView: View {
  
  var selectedVideo: String
  var title: String

  var body: some View {
    
    VStack {
      
      VideoPlayer(player: playVideo(selectedVideo, fileFormat: "mp4"))
        .overlay(
          Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .padding(.top, 6)
            .padding(.horizontal, 8),
          alignment: .topLeading
      )
    }
    .accentColor(.accentColor)
    .navigationBarTitle(title, displayMode: .inline)
  }
}



struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        VideoPlayerView(selectedVideo: "lion", title: "Lion")
      }
    }
}
