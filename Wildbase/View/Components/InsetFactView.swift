//
//  InsetFactView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct InsetFactView: View {
    
    let animal: Animal

    var body: some View {
        
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                        .padding(.horizontal)
                }
            }
            .frame(minHeight: 150, idealHeight: 175, maxHeight: 200)
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

#Preview {
    
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    
    InsetFactView(animal: animals[0])
}
