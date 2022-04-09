//
//  MotionInfoViewCell.swift
//  Multitool
//
//  Created by Anon Account on 09.04.2022.
//

import UIKit

class MotionInfoViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    var viewModel: MotionInfoViewCellViewModel? {
        didSet { configureContent() }
    }

    //MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textBrown
        label.font = .MontserratBold(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstIndicatorTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textBrown
        label.font = .MontserratSemiBold(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondIndicatorTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textBrown
        label.font = .MontserratSemiBold(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var thirdIndicatorTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textBrown
        label.font = .MontserratSemiBold(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstIndicatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textBrown
        label.font = .MontserratRegular(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondIndicatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textBrown
        label.font = .MontserratRegular(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var thirdIndicatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textBrown
        label.font = .MontserratRegular(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var indicatorsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Helpers
    
    private func configureContent() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        
        firstIndicatorTitleLabel.text = viewModel.firstFieldName
        secondIndicatorTitleLabel.text = viewModel.secondFieldName
        thirdIndicatorTitleLabel.text = viewModel.thirdFieldName
        
        firstIndicatorLabel.text = viewModel.firstIndicator
        secondIndicatorLabel.text = viewModel.secondIndicator
        thirdIndicatorLabel.text = viewModel.thirdIndicator
    }
    
    //MARK: - UI Methods
    
    private func configureUI() {
        self.backgroundColor = .clear
        
        buildHierarchy()
        configureConstraints()
    }
    
    private func buildHierarchy() {
        contentView.addSubviews([titleLabel, titlesStackView, indicatorsStackView])
        titlesStackView.addArrangedSubviews([firstIndicatorTitleLabel, secondIndicatorTitleLabel, thirdIndicatorTitleLabel])
        indicatorsStackView.addArrangedSubviews([firstIndicatorLabel, secondIndicatorLabel, thirdIndicatorLabel])
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 19),
            
            titlesStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titlesStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            indicatorsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            indicatorsStackView.leadingAnchor.constraint(equalTo: titlesStackView.trailingAnchor, constant: 10),
            indicatorsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

}
