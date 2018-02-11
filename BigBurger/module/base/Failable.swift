//
//  Failable.swift
//  BigBurger
//
//  Created by Hugues Stéphano TELOLAHY on 2/11/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

protocol Failable {
    func showError(_ error: Error)
}

extension UIViewController: Failable {
    func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(actionButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
