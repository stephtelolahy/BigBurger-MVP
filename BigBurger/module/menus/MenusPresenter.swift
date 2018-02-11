//
//  MenusPresenter.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

class MenusPresenter: BaseMvpPresenter<MenusViewController>, MenusEventHandler {
    
    override func onWillAppear() {
        self.view?.showLoader()
        self.sub(DataManager.shared.getBurgers().subscribe(
            onNext: { (burgers) in
                self.view?.setBurgers(burgers)
                self.view?.hideLoader()
        }, onError: { (error) in
            self.view?.showError(error)
            self.view?.hideLoader()
        }))
    }
    
    func onBurgerSelected(_ burger: Burger) {
        print("Selected burger: \(burger.title)")
    }
}

