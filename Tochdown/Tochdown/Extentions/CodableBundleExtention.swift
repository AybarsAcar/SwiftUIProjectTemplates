//
//  CodableBundleExtention.swift
//  Tochdown
//
//  Created by Aybars Acar on 5/12/21.
//

import Foundation


extension Bundle {
  
  func decode<T: Codable>(_ file: String) -> T {
    
    // locate the json file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in the bundle.")
    }
    
    // create a prop for the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) in the bundle.")
    }
    
    // create a decoder
    let decoder = JSONDecoder()
    
    // create an object from the decoded data
    guard let obj = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to parse \(file) from JSON.")
    }
    
    return obj
  }
  
}
