//
//  ContentView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct BrowseView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    @State private var isGridView = false
    @State private var gridColumns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridColumnNumber = 2
    @State private var gridImageName = "square.grid.2x2"
    
    func changeGrid() {
        gridColumns = Array(repeating: GridItem(.flexible()), count: gridColumnNumber)
    }
    
    var body: some View {
        NavigationView {
            Group {
                if(self.isGridView) {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridColumns, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    Image(animal.image)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                        .animation(.easeIn, value: UUID())
                    }
                } else {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(self.animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Wildbase")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            print("List button tapped")
                            self.isGridView = false
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridView ? .primary : Color.accent)
                        }
                        
                        Button {
                            print("Grid button tapped")
                            if(self.isGridView) {
                                switch(gridColumnNumber) {
                                case 1:
                                    gridColumnNumber = 2
                                    gridImageName = "square.grid.2x2"
                                case 2:
                                    gridColumnNumber = 3
                                    gridImageName = "square.grid.3x2"
                                case 3:
                                    gridColumnNumber = 1
                                    gridImageName = "rectangle.grid.1x2"
                                default:
                                    gridColumnNumber = 1
                                    gridImageName = "square.grid.2x2"
                                }
                                changeGrid()
                            }
                            self.isGridView = true
                        } label: {
                            Image(systemName: gridImageName)
                                .font(.title2)
                                .foregroundStyle(isGridView ? .accent : .primary)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BrowseView()
}
