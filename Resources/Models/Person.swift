//
//  Person.swift
//  tmdb
//
//  Created by M1Dr05 on 26/12/20.
//

import Foundation

struct Person: Decodable {
    var page: Int
    var total_pages: Int
    var results: [ResultPerson] = []
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case total_pages = "total_pages"
        case results = "results"
    }
}

struct ResultPerson : Decodable {
    var popularity:Float
    var id:Int
    var profile_path:String
    var name:String
    
    enum CodingKeys: String, CodingKey {
        case popularity = "popularity"
        case id = "id"
        case profile_path = "profile_path"
        case name = "name"
    }
    
}
