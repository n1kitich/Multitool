//
//  MenuItemViewCellViewModel.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

protocol MenuItemViewCellViewModelType {
    var title: String? { get }
    var description: String? { get }
    var image: UIImage? { get }
}

class MenuItemViewCellViewModel: MenuItemViewCellViewModelType {
    
    private var menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title: String? {
        return menuItem.title
    }
    
    var description: String? {
        return menuItem.description
    }
    
    var image: UIImage? {
        return menuItem.image
    }
}
