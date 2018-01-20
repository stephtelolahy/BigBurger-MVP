//
//  UIViewControllerExtension.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 1/20/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showLoader() {
        if let hud = MBProgressHUD(for: self.HUDSuperView) {
            hud.show(animated: true)
        } else {
            let hud = MBProgressHUD.showAdded(to: self.HUDSuperView, animated: true)
            hud.mode = MBProgressHUDMode.indeterminate
            hud.removeFromSuperViewOnHide = true
            hud.label.text = "Loading"
        }
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: self.HUDSuperView, animated: true)
    }
    
    private var HUDSuperView: UIView {
        if self is UITableViewController, let navigationController = self.navigationController {
            return navigationController.view
        } else {
            return self.view
        }
    }

}
