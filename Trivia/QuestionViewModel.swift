//
//  QuestionViewModel.swift
//  Trivia
//
//  Created by Alejandro O. on 03-10-21.
//

import Foundation

class QuestionViewModel {
    let questionsService: QuestionsService
    var questions = [QuestionsJson]()
    var currentQuestionIndex = 0

    init(service: QuestionsService) {
            self.questionsService = service
    }
    
    func getQuestionsServ(completion: @escaping () -> Void) {
        questionsService.getQuestionsJSON {
        questions in
        self.questions = questions
            return completion()
           }
        }
    

        
        func areQuestionsAvailable() -> Bool {
            !questions.isEmpty
        }
        
        func questionsCount() -> Int {
            return questions.count
        }
        
        func getQuestion(at index: Int) -> QuestionsJson {
            questions[index]
        }
    
        func getNextQuestion() -> String {
            updateIndex()
            return getCurrentQuestion()
        }
        
        func getCurrentQuestion() -> String   {
            if needToResetIndex() { resetIndex() }
            return questions[currentQuestionIndex].question
        }
        
        private func updateIndex() {
            currentQuestionIndex += 1
        }
        
        private func resetIndex() {
            currentQuestionIndex = 0
        }
        
        private func needToResetIndex() -> Bool {
            currentQuestionIndex >= questions.count
        }
        
        func validateCurrentQuestion(answer: String) -> Bool {
            questions[currentQuestionIndex].correct_answer == answer
          
        }
    
}
