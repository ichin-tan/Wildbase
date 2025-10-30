//
//  ContentView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct BrowseView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(self.animals) { animal in
                    AnimalListItemView(animal: animal)
                }
            }
            .navigationTitle("Wildbase")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    BrowseView()
}
