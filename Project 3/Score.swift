//
//  Score.swift
//  Project 3
//
//  Created by Habibur Rahman on 4/13/22.
//

import Foundation

struct Score: Decodable {
    let response: Response
}

struct Response: Decodable {
     let items: [Item]
}

struct Item: Decodable {
    
    let title: String
    let subtitle: String
    let formate: String
   
    let competition: Competition
    let teamA: TeamA
    let teamB: TeamB
    let venue: Venue
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case subtitle = "subtitle"
        case formate = "format_str"
        case competition = "competition"
        case teamA = "teama"
        case teamB = "teamb"
        case venue = "venue"
    }
}
    
    struct Competition: Decodable {
        let title: String
        let status: String
        let dateStart: String
        let dateEnd: String
        
        
        enum CodingKeys: String, CodingKey {
            case title = "title"
            case status = "status"
            case dateStart = "datestart"
            case dateEnd = "dateend"
            
            
            
        }
    }

    struct TeamA: Decodable {
        let name: String
        let logo: String
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case logo = "logo_url"
        }
        
    }

    struct TeamB: Decodable {
        let name: String
        let logo: String
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case logo = "logo_url"
        }
    }

    struct Venue: Decodable {
        let location: String
    }

