//
//  UIViewController+MvpView.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 2/10/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController: MvpView {
    
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
    
    func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(actionButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
