//
//  MenusViewController.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class MenusViewController: UITableViewController, MenusView {
    
    // MARK: Fields
    
    private var presenter: MenusEventHandler?
    private var burgers: [Burger] = []

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MenusPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.onWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.presenter?.onWillDisappear()
    }
    
    // MARK: MenusView
    
    func setBurgers(_ burgers: [Burger]) {
        self.burgers = burgers
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return burgers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BurgerCell", for: indexPath) as! BurgerCell
        cell.update(with: self.burgers[indexPath.row])
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.onBurgerSelected(self.burgers[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
