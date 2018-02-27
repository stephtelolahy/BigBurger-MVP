//
//  MvpPresenter.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 2/11/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class MvpPresenter<T: MvpView>: EventHandler {
    
    // MARK: Fields
    unowned var view: T
    private var subscriptions: [Disposable] = []
    
    // MAR: Init
    
    init(view: T) {
        self.view = view
    }
    
    // MARK: EventHandler
    
    func onWillAppear() {}
    
    func onWillDisappear() {
        self.unSub()
        self.view.hideLoader()
    }
    
    // MARK: ObservableHandler
    
    func sub(_ disposable: Disposable) {
        self.subscriptions.append(disposable)
    }
    
    func unSub() {
        while !subscriptions.isEmpty {
            subscriptions.popLast()?.dispose()
        }
    }
}

