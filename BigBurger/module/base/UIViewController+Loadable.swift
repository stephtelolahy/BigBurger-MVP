//
//  UIViewController+Loadable.swift
//  BigBurger
//
//  Created by Stéphano TELOLAHY on 27/02/2018.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import MBProgressHUD

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
