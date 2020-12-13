//
//  ApiClient.swift
//  tmdb
//
//  Created by M1Dr05 on 11/12/20.
//

import Foundation
import Alamofire
import RxSwift

class ApiClient {
    
    static func getParams(page:Int = 1) -> Parameters {
        return ["api_key":Utils.GLOBAL.apiKey,
                "language":NSLocale.current.languageCode ?? "en-EN",
                "page":page,
                "region":Locale.current.regionCode ?? "US"]
    }
    
    static func getParamsSearch(page:Int, query: String) -> Parameters {
        return ["api_key":Utils.GLOBAL.apiKey,
                "language":NSLocale.current.languageCode ?? "en-EN",
                "page":page,
                "region":Locale.current.regionCode ?? "US",
                "query":query]
    }
    
    static func onGetGendersMovies(callback:@escaping(Genders?,String?)->()) -> Void {
        
        print("-------------------------------")
        print("*     onGetGendersMovies      *")
        print("-------------------------------")
        
        Network.instance.request(Utils.URL.genderMovie,method: .get,parameters: getParams(),encoding: JSONEncoding.default)
            .validate(contentType: ["application/json"])
            .rx.json(t: Genders.self)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { callback($0,nil) },
                onError: { callback(nil,$0.localizedDescription) }
            ).disposed(by: DisposeBag())
    }
    
    static func onGetGendersTv(callback:@escaping(Genders?,String?)->()) -> Void {
        
        print("-------------------------------")
        print("*       onGetGendersTv        *")
        print("-------------------------------")
        
        Network.instance.request(Utils.URL.genderTv,method: .get,parameters: getParams(),encoding: JSONEncoding.default)
            .validate(contentType: ["application/json"])
            .rx.json(t: Genders.self)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { callback($0,nil) },
                onError: { callback(nil,$0.localizedDescription) }
            ).disposed(by: DisposeBag())
        
    }
    
}
