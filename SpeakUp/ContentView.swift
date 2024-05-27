//
//  ContentView.swift
//  SpeakUp
//
//  Created by Lonard Steven on 20/05/24.
//

import SwiftUI
import Lottie

struct ContentView: View {
    
    @EnvironmentObject private var game: Game
    
    @State private var animateView = false
    @State private var showLanguageSelectView = false

    var body: some View {
        GeometryReader { geo in
            if showLanguageSelectView {
                LanguageSelectView()
            } else {
                ZStack {
                    Constants.bgGradient.opacity(0.8)
                    
                    VStack {
                        if animateView {
                            // game title (SpeakUp)
                            VStack {
                                Text("SpeakUp")
                                    .font(.custom(Constants.ofRegular, size: geo.size.height * 0.15))
                                    .padding(.top, 75)
                                    .opacity(0.5)
                                    .transition(.opacity)
                            }
                            
                            
                            Spacer()
                            
                            HStack {
                                LottieView(lottieFile: "animation_wave", speed: 0.1, height: geo.size.height/1.4, width: geo.size.width/1.2)
                                LottieView(lottieFile: "animation_wave", speed: 0.1, height: geo.size.height/1.4, width: geo.size.width/1.2)
                                    .offset(x: -4.5)
                            }
                            
                            Spacer()
                            
  
                                Button {
                                    showLanguageSelectView.toggle()
                                    Helper.sharedHelper.playClickSfx()
                                } label: {
                                    Image(systemName: "play.fill")
                                        .font(.system(size: geo.size.height * 0.1))
                                        .padding(15)
                                    
                                    Text("Start game")
                                        .font(.custom("Outfit-Regular", size: geo.size.height * 0.05))
                                        .padding(15)
                                }
                                .background(.regularMaterial)
                                .cornerRadius(geo.size.height * 0.15)
                                .padding(75)
                                .onTapGesture {
                                    Helper.sharedHelper.playClickSfx()
                                }
                        }
                    }
                    .animation(.linear(duration: 2).delay(3), value: animateView)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .onAppear {
            Helper.sharedHelper.playBackgroundAudio()
            animateView = true
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
        .environmentObject(Game())
}
