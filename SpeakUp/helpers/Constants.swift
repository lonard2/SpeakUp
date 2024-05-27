//
//  Constants.swift
//  SpeakUp
//
//  Created by Lonard Steven on 26/05/24.
//

import Foundation
import SwiftUI


enum Constants {
    static let bgGradient = LinearGradient(colors: [.mainColorOne, .mainColorTwo], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let ofRegular = "Outfit-Regular"
    static let ofBold = "Outfit-Bold"
    static let ofMedium = "Outfit-Medium"
    static let ofLight = "Outfit-Light1"
    static let ofExtraBold = "Outfit-ExtraBold"
    
    static let sampleQuestion = try! JSONDecoder().decode([LevelInfo].self, from: Data(contentsOf: Bundle.main.url(forResource: "questions", withExtension: "json")!))[0].questions[0]
    
}
