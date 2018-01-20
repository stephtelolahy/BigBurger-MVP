//
//  MenusPresenter.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

class MenusPresenter: MenusEventHandler {
    
    // MARK: fields
    
    private let view: MenusView
    
    // MARK: Init
    
    init(view: MenusView) {
        self.view = view
    }
    

    // MARK: MenusEventHandler
    
    func onWillAppear() {
        let burgers = DataManager.shared.getBurgers()
        self.view.show(burgers: burgers)
    }
    
    func onBurgerSelected(_ burger: Burger) {
        
    }
}
