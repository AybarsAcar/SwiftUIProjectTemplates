//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Aybars Acar on 5/12/21.
//

import Foundation


extension Bundle {
  
  func decode<T: Codable>(_ file: String) -> T {
    
    // locate json file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in the bundle")
    }
    
    // create property for the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from the bundle")
    }
    
    // create decoder
    let decoder = JSONDecoder()
    
    // create a property for the decoded data
    guard let obj = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to parse \(file) from the bundle")
    }
    
    return obj
  }
  
}
