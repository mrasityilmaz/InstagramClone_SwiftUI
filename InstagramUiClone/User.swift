//
//  User.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 25.01.2022.
//

import Foundation



struct User : Identifiable{
    
    var id : Int
    var username : String
    var imgName :String
    
}


var UserList =
    [
        User(id:0,username: "Raşit Yılmaz", imgName: "userPic2"),
        User(id:1,username: "Ahmet Aksakal", imgName: "userPic6"),
        User(id:2,username: "Hamza Oban", imgName: "userPic5"),
        User(id:3,username: "Aydın Yağız", imgName: "userPic7"),
        User(id:4,username: "Burak Yılmaz", imgName: "userPic3"),
        User(id:5,username: "Mutlu Temur", imgName: "userPic1"),
        User(id:6,username: "Bilinmeyen", imgName: "userPic4"),
        User(id:7,username: "Bilinmeyen", imgName: "userPic4"),
    ]
