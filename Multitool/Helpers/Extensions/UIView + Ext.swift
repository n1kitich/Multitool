//
//  UIView + Ext.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { self.addSubview($0) }
    }
}
