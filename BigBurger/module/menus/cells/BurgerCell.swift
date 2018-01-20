//
//  BurgerCell.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import Kingfisher

class BurgerCell: UITableViewCell {
    
    @IBOutlet weak var burgerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func update(with burger: Burger) {
        self.burgerImageView.kf.setImage(with: URL(string: burger.thumbnail))
        self.titleLabel.text = burger.title
        self.descriptionLabel.text = burger.description
    }
    
    @IBAction func addButtonTouchUpInside(_ sender: Any) {
        
    }
    

}
