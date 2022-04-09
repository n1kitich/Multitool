//
//  MenuHeaderView.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

class MenuHeaderView: UICollectionReusableView {
    
    //MARK: - UI Elements
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "multitool")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        self.backgroundColor = .clear
        
        buildHierarchy()
        configureConstraints()
    }
    
    private func buildHierarchy() {
        addSubview(logoImageView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor)
        ])
    }
}
