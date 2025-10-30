//
//  AnimalListItemView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animal: Animal
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.accent)
                
                Text(animal.description)
                    .font(.footnote)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 10)
            }
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
        
        AnimalListItemView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
