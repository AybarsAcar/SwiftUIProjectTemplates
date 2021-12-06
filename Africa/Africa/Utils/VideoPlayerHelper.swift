//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import Foundation
import AVKit


var videoPlayer: AVPlayer?

func playVideo(_ filename: String, fileFormat: String) -> AVPlayer {
  
  if Bundle.main.url(forResource: filename, withExtension: fileFormat) != nil{
    videoPlayer = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: fileFormat)!)
    
    videoPlayer?.play()
  }
  
  return videoPlayer!
}
