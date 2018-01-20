//
//  DataManager.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/19/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class DataManager {
    
    static let shared = DataManager()

    func getBurgers() -> Observable<[Burger]> {
        let burgers = [Burger.sample, Burger.sample, Burger.sample]
        return Observable.just(burgers)
//        return Observable.error(NSError(domain: "Failed getting burgers", code: 0, userInfo: nil))
    }
}
