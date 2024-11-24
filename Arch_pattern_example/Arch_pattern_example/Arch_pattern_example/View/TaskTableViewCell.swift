//
//  TaskTableViewCell.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import Foundation
import UIKit

class TaskTableViewCell: UITableViewCell {
    static let identifier: String = "TaskTableViewCell"
    
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    
    //Configure cell with data
    func configure(with viewModel: TaskViewModel){
        titleLabel.text = viewModel.name
        descriptionLabel.text = viewModel.species.rawValue
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        descriptionLabel.textColor = .gray
        
    let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
    }
    
    
    
    
}
