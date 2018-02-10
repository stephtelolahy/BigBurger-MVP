//
//  NetworkProvider.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift
import Alamofire

class NetworkProvider {
    
    private let alamoFireManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
    private let headers = ["Content-Type": "application/json"]
    
    private func get(_ stringUrl: String) -> Observable<Any> {
        return Observable.create{ observer in
            self.alamoFireManager.request(stringUrl, method: .get, headers: self.headers)
                .validate()
                .responseJSON { response in
                    print("\n\n==\nRequest: [GET] \(stringUrl)\nHeaders: \(self.headers)\nResponse: \(response)")
                    switch response.result {
                    case .success(let json):
                        observer.onNext(json)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create()
        }
    }
    
    func getBurgers() -> Observable<[Burger]> {
        return self.get("https://bigburger.useradgents.com/catalog/")
            .map({ (json) -> [Burger] in
                guard let array = json as? [[String: Any]] else {
                    throw APIError.mappingError("Failed mapping burgers from response")
                }
                return array.flatMap{ Burger($0) }
            })
    }
}

private extension Burger {
    
    init?(_ json: [String: Any]) {
        guard let ref = json["ref"] as? String,
            let title = json["title"] as? String,
            let description = json["description"] as? String,
            let thumbnail = json["thumbnail"] as? String,
            let price = json["price"] as? Int
            else {
                return nil
        }
        
        self.ref = ref
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.price = price
    }
}
