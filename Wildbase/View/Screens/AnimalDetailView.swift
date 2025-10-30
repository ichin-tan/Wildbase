//
//  AnimalDetailView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .background(
                        Color.accent
                            .frame(height: 5)
                            .offset(y: 20)
                    )
                    .padding(.top)
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accent)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                Group {
                    HStack(spacing: 10) {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.title)
                            .foregroundColor(.accent)
                        
                        Text("Pictures")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    
                    InsertPictureView(animal: self.animal)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
                
                
            }
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
        
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}
