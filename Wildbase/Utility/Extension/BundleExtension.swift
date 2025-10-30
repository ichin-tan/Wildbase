//
//  BundleExtension.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//


import SwiftUI

extension Bundle {
    
    func decode(_ file: String) -> [CoverImage] {
        
        if let url = self.url(forResource: file, withExtension: nil) {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([CoverImage].self, from: data) {
                    return decodedData
                } else {
                    // Proper error handling in case of decoding fails
                   return []
                }
            } else {
                // Proper error handling in case of data can't be initialized
                return []
            }
        } else {
            // Proper error handling if can not find the file from bundle url
            return []
        }
    }
    
}
