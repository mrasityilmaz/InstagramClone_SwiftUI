//
//  InstagramUiCloneApp.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 24.01.2022.
//

import SwiftUI
import AVKit





@main
struct InstagramUiCloneApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabView{
                MainPage(userList: UserList)
                    .tabItem {Image(systemName:  "house")}
                
                
                
                
                
                SearchPage(userList: UserList)
                    .tabItem{Image(systemName:  "magnifyingglass")}
                
                
                
                
                ReelsPage(userList: UserList )
                    .tabItem{Image(systemName:  "play.tv")}
                
                
                
                Text("Shoping Page").tabItem{Image(systemName:  "bag")}
                
                
                
                
                ProfilePage()
                .tabItem{
                    Image(systemName: "person.circle.fill")
                    
                    
                }
            }
        }
    }
    
    
}





