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
    
    init?(_ json: [String: Any]) {
        guard let ref = json["ref"] as? Int,
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
