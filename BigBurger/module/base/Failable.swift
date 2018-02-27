//
//  Failable.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 2/11/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

protocol Failable {
    func showError(_ error: Error)
}
