//
//  LevelSelectView.swift
//  SpeakUp
//
//  Created by Lonard Steven on 21/05/24.
//

import SwiftUI

struct LevelSelectView: View {
    @EnvironmentObject private var game: Game
    @State private var showGameplay = false
    @State private var showLanguageSelect = false
    
    var body: some View {
        GeometryReader { geo in
            
            if showGameplay {
                LevelView()
            } else if showLanguageSelect {
                LanguageSelectView()
            } else {
                ZStack {
                    Constants.bgGradient.opacity(0.8)
                    VStack {
                        HStack {
                            Button {
                                showLanguageSelect.toggle()
                                
                                Helper.sharedHelper.playClickSfx()
                            } label: {
                                Image(systemName: "arrowshape.backward.circle.fill")
                                    .tint(.white)
                                    .font(.system(size: geo.size.height * 0.075))
                                    .padding(geo.size.height * 0.01)
                            }
                            .padding(.top, 50)
                            .padding(.horizontal, 25)
                            
                            Spacer()
                            
                            Text("Levels")
                                .font(.custom(Constants.ofRegular, size: 35))
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                            
                            Spacer()
                            
                        }
                        
                        Spacer()
                        
                        
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
                            
                            ForEach(game.filteredLevels) { level in
                                
                                ZStack {
                                    VStack {
                                        Button {
                                            showGameplay.toggle()
                                            game.filterQuestions(to: Int(level.name)!)
                                            game.newQuestion()
                                            
                                            Helper.sharedHelper.playSecondBackgroundAudio()
                                            Helper.sharedHelper.playClickSfx()
                                        } label: {
                                            VStack {
                                                
                                                Text(level.name)
                                                    .font(.custom( Constants.ofBold, size: geo.size.height * 0.2))
                                                    .multilineTextAlignment(.center)
                                                    .padding(geo.size.height * 0.025)
                                            }
                                        }
                                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
                                    }
                                }
                            }
                        }
                        .padding(geo.size.height * 0.05)
                        
                        Spacer()
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LevelSelectView()
        .environmentObject(Game())
}
