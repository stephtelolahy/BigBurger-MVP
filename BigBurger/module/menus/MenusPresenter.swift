//
//  MenusPresenter.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class MenusPresenter: MenusEventHandler {
    
    // MARK: Fields
    private unowned var view: AnyObject & MenusView
    private var subscriptions: [Disposable] = []
    
    // MAR: Init
    
    init(view: AnyObject & MenusView) {
        self.view = view
    }
    
    // MARK: Observable handling
    
    func sub(_ disposable: Disposable) {
        self.subscriptions.append(disposable)
    }
    
    func unSub() {
        while !subscriptions.isEmpty {
            subscriptions.popLast()?.dispose()
        }
    }
    
    // MARK: EventHandler
    
    func onWillAppear() {
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
    
    func onWillDisappear() {
        self.unSub()
        self.view.hideLoader()
    }
    
    // MARK: MenusEventHandler
    
    func onBurgerSelected(_ burger: Burger) {
        print("Selected burger: \(burger.title)")
    }
}

