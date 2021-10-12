//
//  Questions.swift
//  Trivia
//
//  Created by Alejandro O. on 05-10-21.
//

import Foundation


struct Question: Decodable {
    var results: [QuestionJson]
}

struct QuestionJson: Decodable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

