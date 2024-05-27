//
//  GameViewModel.swift
//  SpeakUp
//
//  Created by Lonard Steven on 26/05/24.
//

import Foundation

class Game: ObservableObject {
    @Published var gameScore = 0

    var allLanguages: [Language] = []
    var allLevels: [LevelInfo] = []
    var allQuestions: [Question] = []
    
    var filteredLevels: [LevelInfo] = []
    var filteredQuestions: [Question]? = []
    private var answeredQuestions: [Int] = []
    
    var currentQuestion = Constants.sampleQuestion
    
    init() {
        decodeLanguages()
        decodeLevels()
    }
    
    func startGame() {
        gameScore = 0
        answeredQuestions = []
    }
    
    func filterLevels(to language : Int) {
        filteredLevels = allLevels.filter { level in
            level.language == language
        }
    }
    
    func filterQuestions(to specificLevel : Int) {
        filteredQuestions = allLevels.filter { level in
            Int(level.name) == specificLevel
        }.first?.questions
    }
    
    func newQuestion() {
        if filteredQuestions != nil {
            return
        }
        
        if answeredQuestions.count == filteredQuestions?.count {
            answeredQuestions = []
        }
        
        var potentialQuestion = filteredQuestions?.randomElement()!
        
        while answeredQuestions.contains(potentialQuestion?.id ?? 0) {
            potentialQuestion = filteredQuestions?.randomElement()!
        }
        
        currentQuestion = potentialQuestion!
    }
    
    func correct() {
        answeredQuestions.append(currentQuestion.id)
    
    }
    
    private func decodeLanguages() {
        if let url = Bundle.main.url(forResource: "language", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allLanguages = try decoder.decode([Language].self, from: data)
            } catch {
                print("Error decoding JSON data for decoding languages: \(error)")
            }
        }
    }
    
    private func decodeLevels() {
        if let url = Bundle.main.url(forResource: "questions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                
                allLevels = try decoder.decode([LevelInfo].self, from: data)
            } catch {
                print("Error decoding JSON data for decoding levels: \(error)")
            }
        }
    }
}
