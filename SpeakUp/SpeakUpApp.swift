//
//  SpeakUpApp.swift
//  SpeakUp
//
//  Created by Lonard Steven on 20/05/24.
//

import SwiftUI

@main
struct SpeakUpApp: App {
    @StateObject private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
