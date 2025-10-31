//
//  Video.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

struct Video: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    
    var thumbNail: String {
        return "video-\(id)"
    }
}
