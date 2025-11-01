//
//  GalleryView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
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
