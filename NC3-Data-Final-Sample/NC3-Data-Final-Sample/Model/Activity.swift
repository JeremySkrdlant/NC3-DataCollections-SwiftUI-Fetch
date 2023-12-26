//
//  Activity.swift
//  NC3-Data-Final-Sample
//

import Foundation

struct Activity:Identifiable, Codable{
    var id = UUID()
    var title: String
    var timeToComplete: Int
    var description: String
    var competencies: [String]
    var toolsNeeded: [String]
    var imageURL: String
    
    enum CodingKeys: String, CodingKey {
            case title
            case timeToComplete
            case description
            case competencies
            case toolsNeeded
            case imageURL
    }
}
