//
//  ScoreManager.swift
//  Project 3
//
//  Created by Habibur Rahman on 4/13/22.
//

import Foundation

class ScoreManager {
    
    func fetchScore(completionHandler: @escaping (Score?, Error?) -> Void) {
        let url = URL(string: "https://rest.entitysport.com/v2/matches/?status=1&token=ec471071441bb2ac538a0ff901abd249")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            if let data = data {
                do {
                   let response = try JSONDecoder().decode(Score.self, from: data)
                    completionHandler(response, nil)
                    
                } catch {
                    
                }
            }
            completionHandler(nil, error)
        }.resume()
    }
    
}
