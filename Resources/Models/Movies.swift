//
//  Movies.swift
//  tmdb
//
//  Created by M1Dr05 on 26/12/20.
//

import Foundation

struct Movies : Decodable {
    var page: Int
    var total_pages: Int
    var results: [ResultMovies] = []
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case total_pages = "total_pages"
        case results = "results"
    }
}

struct ResultMovies : Decodable {
    
    var vote_count: Int
    var id: Int
    var vote_average: Float
    var title: String
    var poster_path: String
    var genre_ids: [Int] = []
    var backdrop_path: String
    var overview: String
    var release_date: String
    
    enum CodingKeys: String, CodingKey {
        case vote_count = "vote_count"
        case id = "id"
        case vote_average = "vote_average"
        case title = "title"
        case poster_path = "poster_path"
        case genre_ids = "genre_ids"
        case backdrop_path = "backdrop_path"
        case overview = "overview"
        case release_date = "release_date"
    }
}
