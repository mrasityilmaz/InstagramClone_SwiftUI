//
//  ProfilePage.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 3.02.2022.
//

import SwiftUI

struct ProfilePage: View {
    @State var currentTab : Int = 0
    
    var body: some View {
        VStack{
            HStack{
                Text("Raşit Yılmaz")
                    .font(.title).bold()
                Spacer()
                Image(systemName: "plus.app")
                    .resizable()
                    .frame(width:25,height:25)
                    .padding(.all,5)
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width:25,height:25)
                    .padding(.all,5)
            }
            .padding(.horizontal)
            
            
            
            VStack{
                HStack{
                    Image(UserList[0].imgName)
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())

                    Spacer()
                    VStack{Text("0").font(.title2).bold()
                        Text("Gönderi").font(.title3).fontWeight(.light)
                    }
                    Spacer()
                    VStack{Text("24").font(.title2).bold()
                        Text("Takipçi").font(.title3).fontWeight(.light)
                    }
                    Spacer()
                    VStack{Text("29").font(.title2).bold()
                        Text("Takip").font(.title3).fontWeight(.light)
                    }
                    Spacer()
                    
                }
                .padding(.horizontal)
               
                
                
                Button{
                    
                }label:{
                    Text("Mesaj")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width:250,height:25)
                        .overlay(
                                        RoundedRectangle(cornerRadius: 3)
                                            .stroke(Color.gray, lineWidth: 3)
                                        
                )}
                .background(Color.white)
                    .cornerRadius(3)
                    .padding(.leading,100)
                    .padding(.top,-10)
            }
            
            
            
            HStack{
                VStack(alignment: .leading){
                    Text("Raşit Yılmaz").bold()
                    Text("FÜ-Software Engineer 4/4")
                }
                Spacer()
            }
            .padding(.horizontal)
            
            
          
            
            
            
            HStack{
                Spacer()
                Button{
                    withAnimation {
                        currentTab = 0
                    }
                }label:{
                    if currentTab == 0 {
                        Image(systemName: "square.grid.3x3.square")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width:25,height:25)
                            .padding(.horizontal,50)
                            .overlay(
                                            Rectangle()
                                                .frame(height: 3.0, alignment: .bottom)
                                                .foregroundColor(.blue)
                                                .padding(.top,40)
                                )
                    }
                    else {
                        Image(systemName: "square.grid.3x3.square")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width:25,height:25)
                            .padding(.horizontal,50)
                          
                                
                    }

                }
                Spacer()
                Button{
                    withAnimation {
                        currentTab = 1
                    }
                    
                }label:{
                    if currentTab == 1 {
                        Image(systemName: "play.tv")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width:25,height:25)
                            .padding(.horizontal,50)
                            .overlay(
                                            Rectangle()
                                                .frame(height: 3.0, alignment: .bottom)
                                                .foregroundColor(.blue)
                                                .padding(.top,40)
                                )
                    }
                    else {
                        Image(systemName: "play.tv")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width:25,height:25)
                            .padding(.horizontal,50)
                           
                                
                    }

                }
                Spacer()
                Button{
                    withAnimation {
                        currentTab = 2
                    }
                } label : {
                    
                    if currentTab == 2 {
                        Image(systemName:"person.crop.square.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width:25,height:25)
                            .padding(.horizontal,50)
                            .overlay(
                                            Rectangle()
                                                .frame(height: 3.0, alignment: .bottom)
                                                .foregroundColor(.blue)
                                                .padding(.top,40)
                            )
                        
                    }
                    else {
                        Image(systemName:"person.crop.square.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width:25,height:25)
                            .padding(.horizontal,50)
                    }
                    
                   
                    
                }
               
                Spacer()
            }
            Divider()
           
            
            
           
           
            
            
            
            
            
            
            
            Spacer()
        }
    }
}
