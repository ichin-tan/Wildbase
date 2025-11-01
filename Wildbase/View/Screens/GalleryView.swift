//
//  GalleryView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct GalleryView: View {
    
    var animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    @State var layoutColumns: [GridItem] = Array.init(repeating: GridItem(.flexible()), count: 3)
    @State private var selectedAnimal = "lion"
    
    @State private var columnNumber = 3.0
    
    func createGrid() {
        layoutColumns = Array(repeating: GridItem(.flexible()), count: Int(columnNumber))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 3)
                    )
                
                Slider(value: $columnNumber, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: columnNumber) { oldValue, newValue in
                        self.createGrid()
                    }
                
                LazyVGrid(columns: layoutColumns, alignment: .center, spacing: 10) {
                    ForEach(self.animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(.accent, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = animal.image
                            }
                    }
                }
                .animation(.bouncy, value: UUID())
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 20)
            .onAppear() {
                self.createGrid()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

#Preview {
    GalleryView()
}
