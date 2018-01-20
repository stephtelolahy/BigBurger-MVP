//
//  MenusContracts.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

protocol MenusView: BaseView {
    func setBurgers(_ burgers: [Burger])
}

protocol MenusEventHandler: BaseEventHandler {
    func onBurgerSelected(_ burger: Burger)
}
