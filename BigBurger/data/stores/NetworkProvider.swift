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
    private var headers = ["Content-Type": "application/json"]
    
    private func get(_ stringUrl: String) -> Observable<Data> {
        return Observable.create{ observer in
            self.alamoFireManager.request(stringUrl, method: .get, headers: self.headers)
                .validate()
                .responseJSON { response in
                    print("\n\n==\nRequest: [GET] \(stringUrl)\nHeaders: \(self.headers)\nResponse: \(response)")
                    switch response.result {
                    case .success(let json):
                        do {
//                            let data = try JSONSerialization.data(withJSONObject: json)
//                            let validJsonArray = json as! [[String: Any]]
//                            let data = try JSONSerialization.data(withJSONObject: validJsonArray, options: .prettyPrinted)
                            
                            let dictionary = [["ref": 1,"title": "The Big Burger","description": "Un classique mais tellement bon.","thumbnail": "https://bigburger.useradgents.com/images/1.png","price": 92820]]
//                            let dictionary = json as! [[String: Any]]
                            let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
                            let jsonString = String(data: jsonData!, encoding: .utf8)
                            let data = jsonString!.data(using: .utf8)!
                            observer.onNext(data)
                            observer.onCompleted()
                        } catch let error {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
            }
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

