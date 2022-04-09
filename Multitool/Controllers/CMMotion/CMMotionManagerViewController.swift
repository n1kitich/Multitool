//
//  CMMotionManagerViewController.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit
import CoreMotion

class CMMotionManagerViewController: UIViewController {

    //MARK: - Properties
    
    let motionManager = CMMotionManager()
    var viewModel: CMMotionViewModelType = CMMotionViewModel()
    
    //MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Core Motion"
        label.font = .MontserratBold(size: 16)
        label.textColor = .textBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    
    private lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightYellow
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
        tableView.rowHeight = 110
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MotionInfoViewCell.self, forCellReuseIdentifier: MotionInfoViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureMotion()
    }
    
    //MARK: - Selectors
    
    @objc private func handleDismissal() {
        self.dismiss()
    }
    
    //MARK: - Helpers
    
    private func configureMotion() {
        motionManager.deviceMotionUpdateInterval = 1
        
        motionManager.startDeviceMotionUpdates(to: .main) { (motion, error) in
            guard let motion = motion else { return }
            self.viewModel.deviceMotion = motion
            self.infoTableView.reloadData()
        }
    }
    
    //MARK: - UI Methods
    
    private func configureUI() {
        view.backgroundColor = .lightYellow
        
        buildHierarchy()
        configureConstraints()
    }
    
    private func buildHierarchy() {
        view.addSubviews([backButton, titleLabel, infoTableView])
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 36),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            infoTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
