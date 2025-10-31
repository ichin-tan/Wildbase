//
//  CustomAnnotationView.swift
//  Wildbase
//
//  Created by CP on 31/10/25.
//

import SwiftUI

struct CustomAnnotationView: View {
    
    var location: NationalParkLocation
    @State var isAnimating = false
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .fill(.accent)
                .frame(width: 55, height: 55)
            
            Circle()
                .stroke(lineWidth: 2)
                .foregroundStyle(.accent)
                .frame(width: 53, height: 53)
                .scaleEffect(isAnimating ? 1 : 1.3)
                .opacity(isAnimating ? 1 : 0.5)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(
                    Circle()
                )
        }
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json") ?? []
    
    CustomAnnotationView(location: locations[0])
}
