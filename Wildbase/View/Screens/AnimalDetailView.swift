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
                    .padding()
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accent)
                    .padding(.horizontal)
                
                Group {
                    
                    InsetTitleView(image: "photo.on.rectangle.angled", text: "Pictures")
                    
                    InsetPictureView(animal: self.animal)
                    
                }
                .padding()
                
                Group {
                    
                    InsetTitleView(image: "questionmark.circle", text: "Did you know?")
                    
                    InsetFactView(animal: animal)
                    
                }
                .padding()

                Group {
                    
                    InsetTitleView(image: "info.circle", text: "All about \(animal.name)")
                                        
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                }
                .padding()
                
                Group {
                    InsetTitleView(image: "map", text: "National Parks")
                    
                    InsetMapView()
                }
                .padding()
                
                Group {
                    InsetTitleView(image: "books.vertical", text: "Learn more")
                    
                    WebLinkView(animal: self.animal)
                }
                .padding()
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
