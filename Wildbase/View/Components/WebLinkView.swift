//
//  WebLinkView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct WebLinkView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                    
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accent)
            }
        }
    }
}

#Preview {
    
    let animals : [Animal] = Bundle.main.decode("animals.json") ?? []
    
    WebLinkView(animal: animals[0])
}
