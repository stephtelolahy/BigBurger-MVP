//
//  MenusContracts.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

protocol MenusView: BaseView {
    func show(burgers: [Burger])
}

protocol MenusEventHandler {
    func onBurgerSelected(_ burger: Burger)
}
