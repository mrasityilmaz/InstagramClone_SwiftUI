//
//  ContentView.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 24.01.2022.
//

import SwiftUI

struct MainPage: View {
    
    
    var userList : [User]
    
    
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
      
        VStack{
            HStack{
                Image("logoo").resizable().frame(width: 140, height: 50).padding(Edge.Set.horizontal,10)
                
                Spacer()
                
                Image(systemName: "plus.viewfinder").resizable().frame(width: 23, height: 20).foregroundColor(Color.black).padding(Edge.Set.horizontal,25)
                
                Image(systemName: "heart").resizable().frame(width: 23, height: 20).foregroundColor(Color.black).padding(Edge.Set.horizontal,-15)
                
                Image(systemName: "plus.message").resizable().frame(width: 23, height: 20).foregroundColor(Color.black).scenePadding()
                
            }
            
            ScrollView(.vertical,showsIndicators: false){
                
                
                
                ScrollView(.horizontal,showsIndicators: false)
                {
                    HStack{
                        
                        
                        ActiveUserStoryCircle(user:userList[0])
                        
                        
                        ForEach(1..<userList.count  ) {ind in
                            VStack{
                                Image(userList[ind].imgName)
                                    .resizable().aspectRatio(contentMode:.fill)
                                    .clipShape(Circle())
                                    .foregroundColor(Color.red)
                                    .frame(width: 70, height: 70)
                                   
                                    .padding(Edge.Set.horizontal, 2)
                                    .padding(Edge.Set.bottom,-6)
                                   
                                
                                Text(userList[ind].username)
                                    .font(.callout)
                                
                            }
                           
                                        
                            
                            
                        }
                        
                        
                        
                        
                    }
                    
                    
                    
                }
                Divider()
                ScrollView(.vertical,showsIndicators: false){
                    ForEach(0..<userList.count ){i in
                        postUi(userList: userList, index: i)
                    }
                }
            }
            
            Spacer()
            
          
            
            
        }
        
      
       
    
}


}
