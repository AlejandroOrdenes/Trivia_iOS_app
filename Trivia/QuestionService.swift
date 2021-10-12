//
//  QuestionService.swift
//  Trivia
//
//  Created by Alejandro O. on 05-10-21.
//

import Foundation
import Alamofire


class QuestionsService {

//   struct Question: Codable {
//        var response_code: Int
//        var arreglo: [QuestionsJson]
//    }
    let apiClient = AlamofireAPIClient()

    func getQuestionsJSON(completion: @escaping ([QuestionJson]) -> Void) {
        let questionsURL = "https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=boolean"
        apiClient.get(url: questionsURL) { response in
            switch response {
            case .success(let data):

                do {
                    if let data = data {
                        let questions = try JSONDecoder().decode(Question.self, from: data)
                        completion(questions.results)
                        print(questions.results)
                        
                    }
                } catch {
                    completion([])
                    print("Fallo!!")
                }
            case .failure(_):
                completion([])
            }
        }
    }
}
