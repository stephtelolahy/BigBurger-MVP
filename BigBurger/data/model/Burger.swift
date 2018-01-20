//
//  Burger.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/19/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

struct Burger: Codable {
    let ref: Int
    let title: String
    let description: String
    let thumbnail: String
    let price: Int
}


extension Burger {
    
    static var sample: Burger {
        return Burger.init(ref: 1, title: "The Big Burger", description: "Un classique mais tellement bon.", thumbnail: "https://bigburger.useradgents.com/images/1.png", price: 92820)
    }
}
