//
//  Network.swift
//  tmdb
//
//  Created by M1Dr05 on 11/12/20.
//

import Foundation
import Alamofire

class Network {
    
    var session: Session?
    
    static let instance: Session = {
        let session = Alamofire.Session(startRequestsImmediately: true)
        session.session.configuration.timeoutIntervalForResource = 90.0
        session.session.configuration.timeoutIntervalForRequest = 90.0
        return session
    }()
    
}
