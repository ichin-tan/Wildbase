//
//  MotionAnimationView.swift
//  Wildbase
//
//  Created by CP on 31/10/25.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State var isAnimating = false
    @State private var numberOfCircles = Int.random(in: 10...15)
    
    func getRandomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func getRandomSize() -> CGFloat {
        return CGFloat.random(in: 50...70)
    }
    
    func getRandomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    
    func getRandomSpeed() -> CGFloat {
        return CGFloat.random(in: 0.3...1.0)
    }
    
    func getRandomDelay() -> CGFloat {
        return CGFloat.random(in: 0...1)
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                ForEach(0...numberOfCircles, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: self.getRandomSize(), height: self.getRandomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? getRandomScale() : 1)
                        .position(x: self.getRandomCoordinate(max: geometry.size.width), y: self.getRandomCoordinate(max: geometry.size.height)
                        )
                        .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(getRandomSpeed()).delay(getRandomDelay()), value: isAnimating)
                        .onAppear() {
                            isAnimating = true
                        }
                }
            }
            .drawingGroup()
        }
        
    }
}

#Preview {
    MotionAnimationView()
}
