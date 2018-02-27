//
//  MenusPresenter.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

// FIXME: depenency to ViewController
class MenusPresenter: MvpPresenter<MenusViewController>, MenusEventHandler {
    
    // MARK: EventHandler
    
    override func onWillAppear() {
        self.view.showLoader()
        self.sub(DataManager.shared.getBurgers().subscribe(
            onNext: { (burgers) in
                self.view.setBurgers(burgers)
                self.view.hideLoader()
        }, onError: { (error) in
            self.view.showError(error)
            self.view.hideLoader()
        }))
    }
    
    // MARK: MenusEventHandler
    
    func onBurgerSelected(_ burger: Burger) {
        print("Selected burger: \(burger.title)")
    }
}

