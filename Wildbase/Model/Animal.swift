//
//  Animal.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

struct Animal: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    var description: String
    var link: String
    var image: String
    var gallery: [String]
    var fact: [String]
}
