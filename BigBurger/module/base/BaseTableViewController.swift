//
//  BaseTableViewController.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var presenter: (BasePresenter<BaseView>)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.presenter = try self.initPresenter()
        } catch let error {
            print(error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.onWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter?.onWillDisappear()
    }
    
    func initPresenter() throws -> BasePresenter<BaseView>  {
        throw NSError.init(domain: "Should implement InitPresenter \(BaseTableViewController.self)", code: 0, userInfo: nil)
    }
}
