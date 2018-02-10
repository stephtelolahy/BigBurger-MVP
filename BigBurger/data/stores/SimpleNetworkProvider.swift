//
//  SimpleNetworkProvider.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 2/10/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift
import Alamofire

class SimpleNetworkProvider: NetworkProvider {
    
    private let alamoFireManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
    private let headers = ["Content-Type": "application/json"]
    
    private func get<T: Codable>(_ class: T.Type, from url: String) -> Observable<T> {
        return Observable.create{ observer in
            self.alamoFireManager.request(url, method: .get, headers: self.headers)
                .validate()
                .responseData(completionHandler: { (dataResponse) in
                    do {
                        let model = try JSONDecoder().decode(T.self, from: dataResponse.data!)
                        observer.onNext(model)
                        observer.onCompleted()
                    } catch let error {
                        print("Failed mapping model from response")
                        observer.onError(error)
                    }
                })
            return Disposables.create()
        }
    }
    
    func getBurgers() -> Observable<[Burger]> {
        return self.get([Burger].self, from: "https://bigburger.useradgents.com/catalog/")
    }
}

