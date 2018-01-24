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
    
    private let networkProvider = NetworkProvider()

    func getBurgers() -> Observable<[Burger]> {
        return self.networkProvider.getBurgers().retry(2)
    }
}
