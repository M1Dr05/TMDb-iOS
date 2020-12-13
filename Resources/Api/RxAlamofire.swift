//
//  RxAlamofire.swift
//  tmdb
//
//  Created by M1Dr05 on 11/12/20.
//

import Foundation
import Alamofire
import RxSwift

extension Request: ReactiveCompatible {}

extension Reactive where Base: DataRequest {

    func json<T: Decodable>(t: T.Type) -> Observable<T> {
        return Observable.create { observer in
            
              let request = self.base
              request.responseJSON { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    
                    do {
                        let json = (data as! String).data(using: .utf8)!
                        let model: T = try JSONDecoder().decode(T.self, from: json)
                        observer.onNext(model)
                    } catch let error {
                        observer.onError(error)
                    }
                    
                    observer.onCompleted()
                    
                case .failure(let error):
                    observer.onError(error)
                }
              }

              return Disposables.create {
                request.cancel()
              }
            }
    }
}
