//
//  VideoView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    var video: Video
    
    var body: some View {
        VStack {
            if let player = VideoManager.shared.getVideoPlayerFor(videoName: video.id, videoExtension: "mp4") {
                VideoPlayer(player: player)
            } else {
                ContentUnavailableView("No video available!", systemImage: "info.circle")
            }
        }
        .accentColor(.accent)
        .navigationTitle(video.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    let videos: [Video] = Bundle.main.decode("videos.json") ?? []
    
    VideoView(video: videos[0])
}
