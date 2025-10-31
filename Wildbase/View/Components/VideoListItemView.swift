//
//  VideoListItemView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct VideoListItemView: View {
    
    let video: Video
    
    var body: some View {
        
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbNail)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .cornerRadius(10)

                Image(systemName: "play.circle")
                    .font(.system(size: 40))
            }
                
            
            VStack(alignment: .leading, spacing: 5) {
                Text(video.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    
    let videos : [Video] = Bundle.main.decode("videos.json") ?? []
    
    VideoListItemView(video: videos[0])
}
