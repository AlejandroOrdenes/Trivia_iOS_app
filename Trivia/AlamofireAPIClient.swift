//
//  AlamofireAPIClient.swift
//  Trivia
//
//  Created by Alejandro O. on 03-10-21.
//

import Foundation

import Alamofire

 

class AlamofireAPIClient {

    

    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {

        AF.request(url).response { response in

            completion(response.result)

        }

    }

}









    

    




