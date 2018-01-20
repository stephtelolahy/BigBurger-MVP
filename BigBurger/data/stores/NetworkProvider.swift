//
//  NetworkProvider.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift
import Alamofire

class NetworkProvider {
    
    let configuration = URLSessionConfiguration.default
    var alamoFireManager = Alamofire.SessionManager.default
    var headers: [String: String] = ["Content-Type": "application/json"]
    
    init() {
        self.configuration.timeoutIntervalForRequest = 30
        self.configuration.timeoutIntervalForResource = 30
        self.alamoFireManager = Alamofire.SessionManager(configuration: self.configuration)
    }
}
