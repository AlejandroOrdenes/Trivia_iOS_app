//
//  Questions.swift
//  Trivia
//
//  Created by Alejandro O. on 05-10-21.
//

import Foundation


struct QuestionsJson: Codable {

        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correct_answer: String
        var incorrect_answers: [String]

}
