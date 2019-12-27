//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Janet Van on 23.12.2019.
//  Copyright © 2019 Janet Van. All rights reserved.
//

import Foundation

// Observable Object broadcase one or many of its properties
class NetworkManager: ObservableObject {
    // hear from it when the property change => notify when the property changes
    @Published var posts = [Post]()
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch  {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
