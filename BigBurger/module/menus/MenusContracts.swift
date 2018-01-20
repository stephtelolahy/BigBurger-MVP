//
//  MenusContracts.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

protocol MenusView {
    func show(burgers: [Burger])
    func show(error: Error)
}

protocol MenusEventHandler {
    func onWillAppear()
    func onWillDisappear()
    func onBurgerSelected(_ burger: Burger)
}
