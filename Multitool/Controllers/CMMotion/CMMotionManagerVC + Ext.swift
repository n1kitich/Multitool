//
//  CMMotionManagerVC + Ext.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

extension CMMotionManagerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MotionInfoViewCell.identifier, for: indexPath) as! MotionInfoViewCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? MotionInfoViewCellViewModel
        return cell
    }
}
