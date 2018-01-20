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
    
    private let view: MenusView
    private var subscriptions: [Disposable] = []
    
    // MARK: Init
    
    init(view: MenusView) {
        self.view = view
    }
    
    // MARK: Subscriptions
    
    func sub(_ disposable: Disposable) {
        self.subscriptions.append(disposable)
        print("self.subscriptions: \(self.subscriptions)")
    }
    
    func unSub() {
        while !subscriptions.isEmpty {
            subscriptions.popLast()?.dispose()
        }
        print("subscription disposed: \(self.subscriptions)")
    }

    // MARK: MenusEventHandler
    
    func onWillAppear() {
        self.sub(DataManager.shared.getBurgers().subscribe(
            onNext: { (burgers) in
            self.view.show(burgers: burgers)
        }, onError: { (error) in
            self.view.show(error: error)
        }))
    }
    
    func onWillDisappear() {
        self.unSub()
    }
    
    func onBurgerSelected(_ burger: Burger) {
        
    }
}

