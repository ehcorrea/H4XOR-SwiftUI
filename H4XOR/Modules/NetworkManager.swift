//
//  NetworkManager.swift
//  H4XOR
//
//  Created by Emilio Henrique Corrêa on 25/06/23.
//

import Foundation

class NetworkManager : ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { ( data, response, error) in
                if error == nil {
                    let deconder = JSONDecoder()
                    if let safeDate = data{
                        do{
                            let results = try deconder.decode(Results.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            self.posts = results.hits
                        } catch {
                            print(error)
                        }
                       
                    }
                }
                   
            }
            task.resume()
        }
    }
}
