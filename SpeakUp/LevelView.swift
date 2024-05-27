//
//  LevelView.swift
//  SpeakUp
//
//  Created by Lonard Steven on 21/05/24.
//

import SwiftUI

struct LevelView: View {
    @EnvironmentObject private var game: Game
    @State private var backToLevelSelect = false
    
    var body: some View {
        
        GeometryReader { geo in
            if backToLevelSelect {
                LevelSelectView()
            } else {
                ZStack {
                    Constants.bgGradient.opacity(0.8)
                    
                    VStack {
                        VStack {
                            HStack {
                                Button {
                                    backToLevelSelect.toggle()
                                    
                                    Helper.sharedHelper.playClickSfx()
                                    Helper.sharedHelper.playBackgroundAudio()
                                } label: {
                                    Image(systemName: "arrowshape.backward.circle.fill")
                                        .tint(.white)
                                        .font(.system(size: geo.size.height * 0.075))
                                        .padding(geo.size.height * 0.01)
                                }
                                .padding(geo.size.height * 0.05)
                                
                                Spacer()
                                
                                Text("\(game.gameScore)")
                                    .font(.custom(Constants.ofMedium, size: geo.size.height * 0.05))
                                    .padding(geo.size.height * 0.05)
                            }
                            
                            HStack {
                                Text("Level" + game.filteredLevels[0].name)
                                    .font(.custom(Constants.ofMedium, size: geo.size.height * 0.05))
                                    .padding(geo.size.height * 0.05)
                                
                                Spacer()
                                
                                Text("75%")
                                    .font(.custom(Constants.ofExtraBold, size: geo.size.height * 0.05))
                                    .padding(geo.size.height * 0.05)
                            }
                            .offset(y: -geo.size.height * 0.1)
                        }
                        .offset(y: geo.size.height * 0.05)
                        
                        Text(game.currentQuestion.prompt)
                            .font(.custom(Constants.ofRegular, size: geo.size.width * 0.035))
                            .offset(y: -geo.size.height * 0.1)
                            .opacity(0.65)
                        
                        
                        HStack {
                            LottieView(lottieFile: "animation_wave", speed: 0, height: geo.size.height/1.4, width: geo.size.width/1.2)
                            LottieView(lottieFile: "animation_wave", speed: 0, height: geo.size.height/1.4, width: geo.size.width/1.2)
                                .offset(x: -4.5)
                        }
                        .offset(y: -35)
                    }
                    
 
                    
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .onAppear {
            Helper.sharedHelper.playSecondBackgroundAudio()
        }
        .ignoresSafeArea()

    }
}

#Preview {
    LevelView()
        .environmentObject(Game())
}
