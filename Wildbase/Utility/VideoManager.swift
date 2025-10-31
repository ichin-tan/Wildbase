//
//  VideoManager.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import AVFoundation

class VideoManager {
    
    static let shared = VideoManager()
    
    private var videoPlayer: AVPlayer?
    
    func getVideoPlayerFor(videoName: String, videoExtension: String) -> AVPlayer? {
        
        if let files = try? FileManager.default.contentsOfDirectory(atPath: Bundle.main.bundlePath) {
            print("Bundle MP4s: \(files.filter { $0.hasSuffix(".mp4") })")
        }
        
        if let videoURL = Bundle.main.url(forResource: videoName, withExtension: videoExtension) {
            videoPlayer = AVPlayer(url: videoURL)
            videoPlayer?.play()
            return videoPlayer
        }
        return nil
    }
    
}
