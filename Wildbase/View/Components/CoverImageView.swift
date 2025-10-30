//
//  CoverImageView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(self.coverImages) { image in
                Image(image.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
