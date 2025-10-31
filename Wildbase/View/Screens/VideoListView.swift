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
//        Text("Videos")
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: EmptyView()) {
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
