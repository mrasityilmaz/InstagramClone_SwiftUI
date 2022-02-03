//
//  postUi.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 25.01.2022.
//

import SwiftUI

struct postUi: View {
    var userList: [User]
    var index : Int
    
    var body: some View {
        HStack{
            Image(userList[index].imgName)
                .resizable().aspectRatio( contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 40, height: 40, alignment: .leading)
            Text(userList[index].username)
                .font(.headline)
          
           
                
               
            Spacer()
            
            Image(systemName: "ellipsis").padding(Edge.Set.trailing,5)
        }
        .padding(Edge.Set.horizontal,5)
        Image(userList[index].imgName)
            .resizable()
            .frame(height: 400, alignment: .center)
        
        HStack{
            Image(systemName: "heart").resizable().frame(width: 30, height: 27).foregroundColor(Color.black).padding(Edge.Set.all,5)
            Image(systemName: "message").resizable().frame(width: 30, height: 27).foregroundColor(Color.black).padding(Edge.Set.all,5)
            Image(systemName: "paperplane").resizable().frame(width: 30, height: 27).foregroundColor(Color.black).padding(Edge.Set.all,5)
            
            
            Spacer()
            
            Image(systemName: "bookmark")
                .resizable()
                .frame(width: 20, height: 25)
                .foregroundColor(Color.black).padding(Edge.Set.all,10)
            
            
            
        }
        HStack{
            Text("2.234 beğenme")
                .fontWeight(.medium)
            Spacer()
        }.padding(Edge.Set.leading,8)
        
        HStack{
            VStack(){
                Text(userList[index].username+"  ").bold()+Text("Merhaba bu ilk gönderim.Bu gönderi denemek için oluşturuldu.")
              
                    
                
            }
            
            Spacer()
        }.padding(Edge.Set.leading,8)
        
        HStack{
            Text("11 yorumun tümünü gör").foregroundColor(.gray)
            Spacer()
        }.padding(Edge.Set.leading,8)
    
        
        
        
      
       
       
    }
}

