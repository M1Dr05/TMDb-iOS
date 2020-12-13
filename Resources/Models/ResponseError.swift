//
//  ResponseError.swift
//  tmdb
//
//  Created by M1Dr05 on 12/12/20.
//

import Foundation

struct ResponseError : Codable {
    
    var error:String?
    var code:Int
    
}
