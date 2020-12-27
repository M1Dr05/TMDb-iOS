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
    
    static func onGetGendersMovies(url:String,callback:@escaping(Genders?,String?)->()) -> Void {
        
        print("-------------------------------")
        print("*        onGetGenders         *")
        print("-------------------------------")
        
        Network.instance.request(url,method: .get,parameters: getParams(),encoding: JSONEncoding.default)
            .rx.json(t: Genders.self)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { callback($0,nil) },
                onError: { callback(nil,$0.localizedDescription) }
            ).disposed(by: DisposeBag())
    }
    

    static func onGetPersons(page:Int,callback:@escaping(Person?,String?)->()) -> Void {
        
        print("-------------------------------")
        print("*        onGetPersons         *")
        print("-------------------------------")
        
        Network.instance.request("",method: .get,parameters: getParams(page: page),encoding: JSONEncoding.default)
            .rx.json(t: Person.self)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { callback($0,nil) },
                onError: { callback(nil,$0.localizedDescription) }
            ).disposed(by: DisposeBag())
    }
    
    
}
