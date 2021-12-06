//
//  VideoModel.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import Foundation


struct VideoModel : Identifiable, Codable {
  let id: String
  let name: String
  let headline: String
  
  var thumbnail: String {
    "video-\(id)"
  }
}
