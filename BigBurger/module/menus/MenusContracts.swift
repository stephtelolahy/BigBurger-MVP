//
//  MenusContracts.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

protocol MenusView: MvpView {
    func setBurgers(_ burgers: [Burger])
}

protocol MenusEventHandler: MvpPresenter {
    func onBurgerSelected(_ burger: Burger)
}
