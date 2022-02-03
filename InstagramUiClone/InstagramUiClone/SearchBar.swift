//
//  SearchBar.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 1.02.2022.
//

import SwiftUI




func unFocus(){
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}



struct SearchBar: View {
    @State var isTapped:Bool = false
    
    @State private var username: String = ""
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "magnifyingglass").padding(Edge.Set.horizontal,5)
                TextField("Arama", text: $username)
                    .foregroundColor(.black)
                
                    .frame(height: 40)
                    .onTapGesture {
                        isTapped = true
                    }
                
                
                
                
                
            }
            .background(.gray.opacity(0.7))
            .cornerRadius(10)
            
            
            
            
            
            if isTapped {
                Text("İptal").bold().padding(.horizontal)
                    .onTapGesture {
                        unFocus()
                        isTapped.toggle()
                        
                        
                    }
                
            }
        }
        .padding(Edge.Set.horizontal,10)
        .padding(Edge.Set.bottom,10)
    }
}

