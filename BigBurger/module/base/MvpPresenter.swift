//
//  MvpPresenter.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

protocol MvpPresenter {
    func onWillAppear()
    func onWillDisappear()
}

class BaseMvpPresenter<T: AnyObject & MvpView>: MvpPresenter {
    
    weak var view: T?
    private var subscriptions: [Disposable] = []
    
    init(view: T) {
        self.view = view
    }
    
    func onWillAppear() {}
    
    func onWillDisappear() {
        self.unSub()
        self.view?.hideLoader()
    }
    
    func sub(_ disposable: Disposable) {
        self.subscriptions.append(disposable)
    }
    
    func unSub() {
        while !subscriptions.isEmpty {
            subscriptions.popLast()?.dispose()
        }
    }
}

