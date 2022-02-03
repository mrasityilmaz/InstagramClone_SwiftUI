//
//  VideoPlayer.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 2.02.2022.
//

import SwiftUI
import AVKit


struct VideoPlayer: UIViewControllerRepresentable {

    
    var player : AVPlayer
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) ->  AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        
        
        controller.player = player
        controller.showsPlaybackControls = false
        
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.restartPlayback),name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        controller.videoGravity = .resizeAspectFill
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
    
    
    func pausePlayer(){
        player.pause()
    }
    
}

class Coordinator: NSObject{
    
    var parent: VideoPlayer
    
    init(parent: VideoPlayer) {
        self.parent = parent
    }
    
    @objc func restartPlayback(){
        parent.player.seek(to: .zero)
    }
}
