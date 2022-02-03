//
//  Reel.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 2.02.2022.
//

import SwiftUI
import AVKit



struct Reel : Identifiable {
    
    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile : MediaFile
    
}


