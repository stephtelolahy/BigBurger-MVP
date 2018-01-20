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
    
    private func get(_ stringUrl: String) -> Observable<Data> {
        return Observable.create{ observer in
            self.alamoFireManager.request(stringUrl, method: .get, headers: self.headers)
                .validate()
                .responseData(completionHandler: { (response) in
                    if let error = response.error {
                        observer.onError(error)
                    } else if let data = response.data {
                        observer.onNext(data)
                        observer.onCompleted()
                    } else {
                        observer.onError(NSError.init(domain: "Invalid response", code: 0, userInfo: nil))
                    }
                })
            return Disposables.create()
        }
    }
    
    func getBurgers() -> Observable<[Burger]> {
        return self.get("https://bigburger.useradgents.com/catalog/")
            .map({ (data) -> [Burger] in
                return try JSONDecoder().decode([Burger].self, from: data)
            })
    }
}

