//
//  DataManager.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/19/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//


class DataManager {
    
    static let shared = DataManager()

    func getBurgers() -> [Burger] {
        return [Burger.sample, Burger.sample, Burger.sample]
    }
}
