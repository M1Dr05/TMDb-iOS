//
//  Genders.swift
//  tmdb
//
//  Created by M1Dr05 on 12/12/20.
//

import Foundation

struct Genders: Decodable {
    var genres:[ListGenders] = []
    
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
    
}

struct ListGenders : Decodable {
    var id:Int
    var name:String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
