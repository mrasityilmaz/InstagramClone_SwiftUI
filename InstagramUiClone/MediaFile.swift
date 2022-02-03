//
//  MediaFile.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 2.02.2022.
//

import SwiftUI

struct MediaFile: Identifiable{
    
    var id = UUID().uuidString
    
    var url: String
    
    var title : String
    
    var isExpanded : Bool = false
    
    var userId : Int
    
    
}

var MediaFileJson = [
    
    MediaFile(url: "Reels1", title: text,userId: 0),
    MediaFile(url: "Reels2", title: text,userId: 1),
    MediaFile(url: "Reels3", title: text,userId: 2),
    MediaFile(url: "Reels4", title: text,userId: 3),
    MediaFile(url: "Reels5", title: text,userId: 4),
    MediaFile(url: "Reels6", title: text, userId: 5),
]

let text = "Bir gülümsüyorsun o anda hiç bir derdim kalmıyor seni sevmekten başka sesine o güzel sesine öyle bir dalıyorum ki tek çaremin sen olduğunu fark ediyorum. her ne kadar gözlerine hala bakamasamda gözlerinin buğusunu yıllarca izleyebilirim diye geçiriyorum her zaman içimden sana her bana böyle bakma deyişimce aslında bunu ben içimden geçiriyorum."
