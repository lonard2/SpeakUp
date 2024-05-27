//
//  PlayerInfo.swift
//  SpeakUp
//
//  Created by Lonard Steven on 21/05/24.
//

import Foundation

struct LevelInfo: Codable, Identifiable {
    var id: Int
    var name: String
    var language: Int
    var multiplier: Double
    var countdown: Int
    var gold: Int
    var silver: Int
    var bronze: Int
    
    var status: Bool = false
    var questions: [Question]
    
    enum LevelInfoKeys: String, CodingKey {
        case id
        case name
        case language
        case multiplier
        case countdown
        case gold
        case silver
        case bronze
        case status
        case questions
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.language = try container.decode(Int.self, forKey: .language)
        self.multiplier = try container.decode(Double.self, forKey: .multiplier)
        self.countdown = try container.decode(Int.self, forKey: .countdown)
        self.gold = try container.decode(Int.self, forKey: .gold)
        self.silver = try container.decode(Int.self, forKey: .silver)
        self.bronze = try container.decode(Int.self, forKey: .bronze)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.questions = try container.decode([Question].self, forKey: .questions)
    }
}



struct Question: Codable, Identifiable {
    var id: Int
    var type: Int
    var prompt: String
    var sentence: String
    var emotion: Int
    var score: Int
    
    enum QuestionKeys: String, CodingKey {
        case id
        case type
        case prompt
        case sentence
        case emotion
        case score
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: QuestionKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.type = try container.decode(Int.self, forKey: .type)
        self.prompt = try container.decode(String.self, forKey: .prompt)
        self.sentence = try container.decode(String.self, forKey: .sentence)
        self.emotion = try container.decode(Int.self, forKey: .emotion)
        self.score = try container.decode(Int.self, forKey: .score)
    }
}


