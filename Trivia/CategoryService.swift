//
//  CategoriesService.swift
//  Trivia
//
//  Created by Alejandro O. on 03-10-21.
//

import Foundation
import Alamofire


class CategoriesService {
    struct Categories: Codable {
        var trivia_categories: [Category]
    }
    let apiClient = AlamofireAPIClient()
    
    func getCategoriesJSON(completion: @escaping ([Category]) -> Void?) {
        let categoriesURL = "https://opentdb.com/api_category.php"
        apiClient.get(url: categoriesURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let categories = try JSONDecoder().decode(Categories.self, from: data)
                        completion(categories.trivia_categories)
                        print(categories)
                    }
                } catch {
                    completion([])
                  
                }
            case .failure(_):
                completion([])
            }
        }
    }
    
}



