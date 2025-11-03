//
//  VideoListView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = Bundle.main.decode("videos.json") ?? []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoView(video: video)) {
                        VideoListItemView(video: video)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    VideoListView()
}
