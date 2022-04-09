//
//  UIViewController + Ext.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

extension UIViewController {
    func dismiss(animated: Bool = true) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: animated)
        } else {
            self.dismiss(animated: animated)
        }
    }
}
