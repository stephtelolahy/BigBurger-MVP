//
//  BaseTableViewController.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/24/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class BaseTableViewController<T>: UITableViewController {
    
    var presenter: T?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.presenter = try self.initPresenter()!
        } catch {
            print("Please override initPresenter method to instanciate presenter for \(String(describing: self))")
        }
    }
    
    func initPresenter() throws -> T?  {
        throw NSError(domain: "", code: 0, userInfo: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let presenter = self.presenter as? BaseEventHandler {
            presenter.onWillAppear()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let presenter = self.presenter as? BaseEventHandler {
            presenter.onWillDisappear()
        }
        self.hideLoader()
    }

}
