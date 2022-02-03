//
//  SearchPage.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 2.02.2022.
//

import SwiftUI

struct SearchPage: View {
    
    
    var userList : [User]
    
    @State var username: String = ""
    
    @State var isTapped : Bool = false
    
   
    
     var gridItemLayout = [GridItem(.fixed(150), spacing: 2, alignment: .leading),
                                  GridItem(.fixed(150), spacing: 2, alignment: .leading),
                                  GridItem(.fixed(150), spacing: 2, alignment: .leading)]
    
    var body: some View {
        VStack{
            
            
            
            
            
            
            HStack{
                HStack {
                    Image(systemName: "magnifyingglass").padding(Edge.Set.horizontal,5)
                    TextField("Arama", text: $username)
                        .foregroundColor(.black)
                    
                        .frame(height: 40)
                        .onTapGesture {
                            withAnimation {
                                isTapped = true
                            }
                        }
                    
                    
                    
                    
                    
                }
                .background(.gray.opacity(0.5))
                .cornerRadius(10)
                
                
                
                
                
                if isTapped {
                    Text("İptal").bold().padding(.horizontal)
                        .onTapGesture {
                            unFocus()
                            withAnimation {
                                isTapped.toggle()
                            }
                            
                            
                        }
                    
                }
            }
            .padding(Edge.Set.horizontal,10)
            .padding(Edge.Set.bottom,5)
            
            
            
            if isTapped {
                VStack{}
            }
            else{
                ScrollView {
                    ForEach(1..<10){f in
                        LazyVGrid(columns: gridItemLayout, spacing: 2) {
                            ForEach(0..<userList.count ){ind in
                                
                                if ind == 3 {
                                    VStack(spacing: 2) {
                                        
                                        Image(userList[ind].imgName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                        
                                        
                                        
                                        
                                        Image(userList[ind + 1].imgName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                    }
                                    
                                }else if ind == 4 {
                                    
                                    Image(userList[ind  + 1].imgName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 300, height: 300)
                                        .clipped()
                                    
                                    
                                }else {
                                    
                                    Image(userList[ind].imgName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                }
                                
                                if ind == 4 { Color.clear }
                                
                            }
                        }.padding(Edge.Set.bottom,-6)
                    }
                    
                }
            }
            
            
            
            
            
            
            
            Spacer()
            
        }
    }
}


