//
//  BundleExtension.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//


import SwiftUI
import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T? {
        
        if let url = self.url(forResource: file, withExtension: nil) {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode(T.self, from: data) {
                    return decodedData
                } else {
                    // Proper error handling in case of decoding fails
                    return nil
                }
            } else {
                // Proper error handling in case of data can't be initialized
                return nil
            }
        } else {
            // Proper error handling if can not find the file from bundle url
            return nil
        }
    }
    
}
