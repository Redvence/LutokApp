//
//  Networking.swift
//  lutok2
//

import Foundation
import UIKit

struct PostModel: Codable {
    let title: String
    let text: String
}

struct Networking
{
    var baseURLString = "http://localhost:3000"
    var getRequest = "posts"
    
    var url: String {
        return baseURLString + "/api/v1/" + getRequest
    }
    
    var error = false
    var errorDescription = ""

    func getPosts(completion: @escaping ([PostModel]) -> ()) {
        
        var request = URLRequest(url: URL(string: url)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(response)
            print(error)
            if let data = data {
                print(String(data: data, encoding: .utf8))
            }
            if error != nil {
                print("ERROR API")
            } else {
                let decoder = JSONDecoder()
                
                do {
                    let posts = try decoder.decode([PostModel].self, from: data!)
                    completion(posts)
                } catch {
                    print("ERROR DECODING")
                }
            }
        }
        task.resume()
    }
    
}
