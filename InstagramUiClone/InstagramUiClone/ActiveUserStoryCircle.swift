//
//  ActiveUserStoryCircle.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 25.01.2022.
//

import SwiftUI

struct ActiveUserStoryCircle: View {
    var user : User
    var body: some View {
        VStack{
            ZStack{
                Image(user.imgName)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                
                Image(systemName: "plus.circle.fill")
                    
                    .resizable()
                    .foregroundStyle(.white,.blue)
                    .overlay(Circle().stroke(.white,lineWidth: 5))
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .padding(Edge.Set.top,45)
                    .padding(Edge.Set.leading,45)
                    
                 
                
                    
                

            }
            .padding(Edge.Set.horizontal,5)
            .padding(Edge.Set.bottom,-10)
            
            Text("Hikayen")
                .font(.callout)
        }
    }
}


