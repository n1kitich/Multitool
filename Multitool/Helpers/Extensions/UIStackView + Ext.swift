//
//  UIStackView + Ext.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
