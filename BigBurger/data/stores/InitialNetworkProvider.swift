//
//  InitialNetworkProvider.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 2/10/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift
import Alamofire

class InitialNetworkProvider: NetworkProvider {
    
    private let alamoFireManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
    private let headers = ["Content-Type": "application/json"]
    
    private func get(url: String) -> Observable<Any> {
        return Observable.create{ observer in
            self.alamoFireManager.request(url, method: .get, headers: self.headers)
                .validate()
                .responseJSON { response in
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
        return self.get(url: "https://bigburger.useradgents.com/catalog/")
            .map({ (json) -> [Burger] in
                guard let JsonArray = json as? [[String: Any]] else {
                    throw APIError.mappingError("Failed mapping burgers from response")
                }
                var burgers = [Burger]()
                for jsonElement in JsonArray {
                    if let burger = Burger(jsonElement) {
                        burgers.append(burger)
                    }
                }
                return burgers
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

