//
//  BaseEventHandler.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class BasePresenter<T>: BaseEventHandler {
    
    // MARK: Fields
    
    let view: T
    private var subscriptions: [Disposable] = []
    
    // MARK: Init
    
    init(view: T) {
        self.view  = view
    }
    
    // MARK: Events
    
    func onWillAppear() {
    }
    
    func onWillDisappear() {
        unSub()
    }
    
    // MARK: Subscriptions
    
    func sub(_ disposable: Disposable) {
        self.subscriptions.append(disposable)
        print("self.subscriptions: \(self.subscriptions)")
    }
    
    private func unSub() {
        while !subscriptions.isEmpty {
            subscriptions.popLast()?.dispose()
        }
        print("subscription disposed: \(self.subscriptions)")
    }
}
