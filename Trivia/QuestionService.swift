//
//  QuestionService.swift
//  Trivia
//
//  Created by Alejandro O. on 05-10-21.
//

import Foundation
import Alamofire


class QuestionsService {

   struct Question: Codable {
        var response_code: Int
        var arreglo: [QuestionsJson]
    }
    let apiClient = AlamofireAPIClient()

    func getQuestionsJSON(completion: @escaping ([QuestionsJson]) -> Void) {
        let questionsURL = "https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=boolean"
        apiClient.get(url: questionsURL) { response in
            switch response {
            case .success(let data):

                do {
                    if let data = data {
                        let questions = try JSONDecoder().decode(Question.self, from: data)
                        completion(questions.arreglo)
                        print(questions.arreglo)
                    }
                } catch {
                    completion([])
                    print("Fallo1!!")
                }
            case .failure(_):
                completion([])
            }
        }
    }
}
