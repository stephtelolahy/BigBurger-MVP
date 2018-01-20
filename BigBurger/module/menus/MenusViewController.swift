//
//  MenusViewController.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class MenusViewController: UITableViewController {
    
    private var burgers: [Burger] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        burgers = DataManager.shared.getBurgers()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return burgers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BurgerCell", for: indexPath) as! BurgerCell
        cell.update(with: burgers[indexPath.row])
        return cell
    }
}
