//
//  VideoLIstView.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import SwiftUI


struct VideoListView: View {
  
  @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
  
  // create haptic feedback generator
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  var body: some View {
    
    NavigationView {
      
      List {
        
        ForEach(videos) { video in
          NavigationLink(destination: {
            VideoPlayerView(selectedVideo: video.id, title: video.name)
          }, label: {
            VideoListItemView(video: video)
              .padding(.vertical, 8)
          })
          
        }
      }
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarTrailing, content: {
          Button(action: {
            videos.shuffle()
            hapticImpact.impactOccurred() // give haptic impact as we shuffle
          }, label: {
            Image(systemName: "arrow.2.squarepath")
          })
        })
      })
        
    }
  }
}


struct VideoLIstView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
