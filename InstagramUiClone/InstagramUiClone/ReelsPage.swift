//
//  ReelsPage.swift
//  InstagramUiClone
//
//  Created by Muhammed Raşit Yılmaz on 2.02.2022.
//

import SwiftUI
import AVKit


struct ReelsPage: View {
    var userList: [User]
    
    @State var currentReel : String = ""
    
    @State var reels =  MediaFileJson.map{item -> Reel in
         let url = Bundle.main.path(forResource: item.url, ofType: "mp4") ?? ""
         
         let player = AVPlayer(url: URL(fileURLWithPath: url))
         
         
         return Reel(player: player, mediaFile: item)
         
     }
    
    
  
    
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            TabView(selection: $currentReel){
                
                ForEach($reels){$reel in
                    
                    
                    
                    
                    
                    ReelsPlayer(userList:userList,reel: $reel, currentReel: $currentReel)
                        .frame(width: size.width)
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea(.all, edges: .top)
                        .tag(reel.id)
                    
                    
                    
                }
                
            }
            
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode : .never))
            .frame(width: size.width)
        }
        
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.ignoresSafeArea())
        .onAppear{
            currentReel = reels.first?.id ?? ""
        }
        
       
    }
    
}






struct ReelsPlayer : View {
    
    var userList : [User]
    @State var showMore : Bool = false
    @State var isMuted: Bool = false
    @State var VolumeAnimation: Bool = false
    
    @Binding var reel: Reel
    @Binding var currentReel: String
    var body : some View{
        
        ZStack{
            
            
            // Eğer player varsa
            if let player =  reel.player{
                
                
                // Reels Player
                VideoPlayer(player: player)
                
                
                // Reels ve Camera ikonu
                VStack{
                    HStack{
                        Text("Reels")
                            .font(.largeTitle).bold()
                        Spacer()
                        Image(systemName: "camera")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:35,height :30)
                    }
                    .padding(.horizontal)
                    .padding(.top,35)
                    Spacer(minLength: 20)
                }
                
                
                Spacer()
                
                
                // Reels videoları geçerken videonun yarısından azı görünür duruma geldiğinde videoyu durdurur bir sonraki video oynamaya başlar
                GeometryReader{pr -> Color in
                    
                    let minY = pr.frame(in: .global).minY
                    
                    let size = pr.size
                    
                    
                    DispatchQueue.main.async {
                        if -minY < (size.height / 2 ) && minY < (size.height / 2 ) &&
                                (reel.id == currentReel)
                        {
                            
                            player.play()
                        }
                        else {
                            
                            player.pause()
                        }
                    }
                    
                    return Color.clear
                }
                
                
                
                
                
                
                // Ekranın ortasına 150 * 150 transparent kare konur
                // tıklandığında videonun sesini kapatır ve açar
                Color.black
                    .opacity(0.001)
                    .frame(width: 150 , height: 150)
                    .onTapGesture {
                        if VolumeAnimation {
                            return
                        }
                        
                        isMuted.toggle()
                        player.isMuted = isMuted // player susturulur.
                        withAnimation{VolumeAnimation.toggle()}
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation{VolumeAnimation.toggle()}
                        }
                        
                    }
                
                
                
                
                // Açıklama kısmındaki yazıya tıklandığında arka plan karartılır
                Color.black.opacity(showMore ? 0.35 : 0)
                    .onTapGesture{
                        withAnimation{showMore.toggle()
                            
                        }
                    }
                
                
                
                
                
                // Reels alt kısımdaki kontroller
                VStack{
                    HStack(alignment: .bottom){
                        
                        VStack(alignment: .leading , spacing: 10){
                            
                            HStack(spacing: 15){
                                
                                
                                // Reels paylaşan kullanıcı
                                Image(userList[reel.mediaFile.userId].imgName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                
                                // Reels paylaşan kullanıcının adı
                                Text(userList[reel.mediaFile.userId].username)
                                    .font(.callout.bold())
                                
                                // Takip et butonu
                                Button{
                                    
                                } label : {
                                    Text("Takip Et")
                                        .bold()
                                }
                                
                            }
                            
                            
                            
                            ZStack{
                                
                                
                                // Reels paylaşan kullanıcın Açıklama kısmı
                                // devamı yazısına tıklandığında yazı genişler ve bu kısım çalışır
                                if showMore {
                                    
                                    ScrollView(.vertical, showsIndicators: false){
                                        
                                        // Açıklama + uzun bir text
                                        Text(reel.mediaFile.title)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                        
                                    }
                                    .onTapGesture{
                                        withAnimation{showMore.toggle()}
                                    }
                                    .frame(height: 120)
                                }
                                
                                else {
                                    
                                    Button{
                                        withAnimation{showMore.toggle()}
                                    }
                                    label : {
                                        HStack{
                                            // AÇIKLAMA
                                            Text(reel.mediaFile.title)
                                                .font(.callout)
                                                .fontWeight(.semibold)
                                                .lineLimit(1)
                                            
                                            Text("devamı")
                                                .font(.callout.bold())
                                                .foregroundColor(.gray)
                                        }.padding(.top,6)
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                    }
                                }
                            }
                        }
                        
                        Spacer(minLength: 20)
                        
                        
                        // Reels ekranının sağ alt kısmındaki butonlar
                        ActionButtons(reel: reel)
                        
                        
                        
                    }
                    
                    
                    
                    // Reels içerisindeki müzik sayfanın en alt kısmında yer alıyor
                    HStack{
                        Image(systemName: "music.note")
                        Text("Stay in alive...")
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        Spacer(minLength: 20)
                        
                        // Ekranın sağ altında çalan müziğin kare ikonu
                        Image( "rubik")
                            .resizable()
                            .aspectRatio(contentMode:.fill)
                            .frame(width:25,height:25)
                            .cornerRadius(6)
                            .background(
                                RoundedRectangle(cornerRadius: 6).stroke(.white, lineWidth: 3))
                            .offset(x:-5)
                        
                        
                    }.padding(.top,10)
                }
                .padding(.horizontal)
                .padding(.bottom,20)
                .foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                
                // Ekranın ortasına tıklandığında gözükecek hoparlör ikonu
                Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(.secondary)
                    .clipShape(Circle())
                    .foregroundStyle(.black)
                    .opacity(VolumeAnimation ? 1 : 0)
                
                
            }
            
        }
        
    }
}




// Reels ekranının sağ altında yer alan butonlar
struct ActionButtons: View {
    
    var reel :Reel
    // Beğeni butonu için
    @State var isLiked : Bool = false
    
    var body : some View{
        
        VStack(spacing: 25){
            
            Button{
                
                withAnimation{isLiked.toggle()}
            }label : {
                
                VStack(spacing : 10){
                    Image(systemName: isLiked ? "suit.heart.fill" : "suit.heart")
                        .foregroundStyle(isLiked ? .red : .white,.clear)
                        .font(.title)
                    
                    Text("2.4M")
                        .font(.caption.bold())
                    
                    
                    
                }
            }
            
            Button{
            }label : {
                
                VStack(spacing : 10){
                    Image(systemName: "bubble.right")
                        .font(.title)
                    
                    Text("244")
                        .font(.caption.bold())
                    
                    
                    
                }
            }
            
            Button{
            }label : {
                
                VStack(spacing : 10){
                    Image(systemName: "paperplane")
                        .font(.title)
                    
                    
                    
                    
                    
                }
            }
            
            Button{
            }label : {
                
                VStack(spacing : 10){
                    Image(systemName: "ellipsis")
                        .font(.title2)
                    
                    
                    
                    
                    
                }
            }
            Button{
            }label : {
                
                VStack(spacing : 10){
                    
                    
                    
                    
                    
                }
            }
        }
    }
    
}






