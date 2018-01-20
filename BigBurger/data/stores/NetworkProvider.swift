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
    
    private let configuration = URLSessionConfiguration.default
    private let alamoFireManager: Alamofire.SessionManager
    private var headers: [String: String] = ["Content-Type": "application/json"]
    
    init() {
        self.configuration.timeoutIntervalForRequest = 30
        self.configuration.timeoutIntervalForResource = 30
        self.alamoFireManager = Alamofire.SessionManager(configuration: self.configuration)
    }
    
    private func get(_ stringUrl: String) -> Observable<Any> {
        return Observable.create{ observer in
            self.alamoFireManager.request(stringUrl, method: .get, headers: self.headers)
                .validate()
                .responseJSON { response in
                    print("\n\n==\nRequest : [GET] \(stringUrl)\nHeaders: \(self.headers)\nResponse : \(response)")
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
        return self.get("https://bigburger.useradgents.com/catalog/").map({ (json) -> [Burger] in
            guard let jsonArray = json as? [[String: Any]] else {
                throw NSError.init(domain: "Mapping error", code: 0, userInfo: nil)
            }
            var burgers: [Burger] = []
            for jsonElement in jsonArray {
                if let burger = Burger(jsonElement) {
                    burgers.append(burger)
                }
            }
            return burgers
        })
    }
}
