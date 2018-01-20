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
            .delay(5, scheduler: MainScheduler.instance)
//        return Observable.error(NSError(domain: "Failed getting burgers", code: 0, userInfo: nil))
    }
}


private extension Burger {
    
    static var sample: Burger {
        return Burger.init(ref: 1,
                           title: "The Big Burger",
                           description: "Un classique mais tellement bon.",
                           thumbnail: "https://bigburger.useradgents.com/images/1.png",
                           price: 92820)
    }
}
