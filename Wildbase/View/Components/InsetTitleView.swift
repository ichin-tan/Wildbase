//
//  InsetTitleView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct InsetTitleView: View {
    
    let image: String
    let text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(.accent)
            
            Text(text)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    InsetTitleView(image: "glob", text: "Glob")
}
