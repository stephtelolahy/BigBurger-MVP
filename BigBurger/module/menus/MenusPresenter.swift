//
//  MenusPresenter.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class MenusPresenter: MenusEventHandler {
    
    private weak var view: MenusView?
    private var subscriptions: [Disposable] = []
    
    init(view: MenusView) {
        self.view = view
    }
    
    func onWillAppear() {
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
    
    func onWillDisappear() {
        unSub()
        self.view?.hideLoader()
    }
    
    private func sub(_ disposable: Disposable) {
        self.subscriptions.append(disposable)
    }
    
    private func unSub() {
        while !subscriptions.isEmpty {
            subscriptions.popLast()?.dispose()
        }
    }
    
    func onBurgerSelected(_ burger: Burger) {
        
    }
}

