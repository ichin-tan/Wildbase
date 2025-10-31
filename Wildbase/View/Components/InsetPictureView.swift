//
//  InsertPictureView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct InsetPictureView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct InsertPictureView_Previews: PreviewProvider {
    static var previews: some View {
        
        let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
        
        InsetPictureView(animal: animals[0])
    }
}
