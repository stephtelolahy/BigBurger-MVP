//
//  Loadable.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 2/11/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import MBProgressHUD

protocol Loadable {
    func showLoader()
    func hideLoader()
}

extension UIViewController: Loadable {
    func showLoader() {
        if let hud = MBProgressHUD(for: self.view) {
            hud.show(animated: true)
        } else {
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.mode = MBProgressHUDMode.indeterminate
            hud.removeFromSuperViewOnHide = true
            hud.label.text = "Loading"
        }
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
