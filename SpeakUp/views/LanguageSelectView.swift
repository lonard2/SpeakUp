//
//  LanguageSelectView.swift
//  SpeakUp
//
//  Created by Lonard Steven on 21/05/24.
//

import SwiftUI

struct LanguageSelectView: View {
    @EnvironmentObject private var game: Game
    @State private var showLevelSelectView = false
    @State private var showMenu = false
    
    var body: some View {
        GeometryReader { geo in
            
            if showLevelSelectView {
                LevelSelectView()
            } else if showMenu {
                ContentView()
            } else {
                ZStack {
                    Constants.bgGradient.opacity(0.8)
                    VStack {
                        HStack {
                            Button {
                                showMenu.toggle()
                                
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
                            
                            Text("Select your language")
                                .font(.custom(Constants.ofRegular, size: 35))
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                            
                            Spacer()
                            
                        }
                        
                        Spacer()
                        
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
                            
                            ForEach(game.allLanguages) { language in
                                
                                ZStack {
                                    VStack {
                                        Button {
                                            game.filterLevels(to: language.id)
                                            
                                            showLevelSelectView.toggle()
                                            Helper.sharedHelper.playClickSfx()
                                        } label: {
                                            VStack {
                                                Image(systemName: language.icon)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width * 0.075, height: geo.size.height * 0.1)
                                                    .padding(25)
                                                
                                                Text(language.name)
                                                    .font(.custom( Constants.ofBold, size: geo.size.height * 0.05))
                                                    .multilineTextAlignment(.center)
                                            }
                                        }
                                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.3)
                                    }
                                }
                            }
                        }
                        
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
    LanguageSelectView()
        .environmentObject(Game())
}
