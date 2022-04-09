//
//  UITableView + Ext.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
}

extension UITableViewHeaderFooterView {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
