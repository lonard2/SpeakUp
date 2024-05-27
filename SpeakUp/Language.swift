//
//  Language.swift
//  SpeakUp
//
//  Created by Lonard Steven on 21/05/24.
//

import Foundation

struct Language: Decodable, Identifiable {
    var id: Int
    var name: String
    var icon: String
    
    var progress: String
    
    enum LanguageKeys: String, CodingKey {
        case id
        case name
        case icon
        case progress
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: LanguageKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.progress = try container.decode(String.self, forKey: .progress)
    }
}
