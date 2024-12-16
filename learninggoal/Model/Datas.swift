//
//  Datas.swift
//  learninggoal
//
//  Created by Ousmane on 09/12/24.
//
import Foundation
struct Datas: Codable {
    let id : String
    let symbol: String
    let image: String
    let currentPrice : Double
   
    
    private enum CodingKeys: String, CodingKey{
        case id
        case symbol
        case image
        case currentPrice = "current_price"
    }
    
}


struct VideoModel: Codable{
    let id: Int
    let results: [Video]
}

struct Video: Codable{
    let key: String
    let type: String
}



