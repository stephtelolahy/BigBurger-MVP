//
//  NetworkInterface.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

protocol NetworkInterface {
    func getBurgers() -> Observable<[Burger]>
}
