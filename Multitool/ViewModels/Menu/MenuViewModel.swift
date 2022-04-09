//
//  MenuViewModel.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import Foundation

protocol MenuViewModelType {
    var menuItems: [MenuItem] { get set }
    var numberOfItems: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MenuItemViewCellViewModelType
}

class MenuViewModel: MenuViewModelType {
    
    var menuItems: [MenuItem]
    
    var numberOfItems: Int {
        return menuItems.count
    }
    
    init(menuItems: [MenuItem]) {
        self.menuItems = menuItems
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MenuItemViewCellViewModelType {
        let menuItem = menuItems[indexPath.row]
        let cellViewModel = MenuItemViewCellViewModel(menuItem: menuItem)
        return cellViewModel
    }
}
