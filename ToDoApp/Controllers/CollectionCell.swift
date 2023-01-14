//
//  CollectionCell.swift
//  ToDoApp
//
//  Created by Никита Швец on 22.12.2022.
//

import UIKit
import SwipeCellKit

class CollectionCell: SwipeTableViewCell {

    let cellUIView = UIView()
    let cellLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Constants.CellIndentificators.collectionCellIdentificator)
        configureCollectionCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionCell {
    
    func configureCollectionCellUI() {
        configurecCellUIView()
        configureCellLabel()
    }
    
    func configurecCellUIView() {
        contentView.addSubview(cellUIView)
        cellUIView.translatesAutoresizingMaskIntoConstraints = false
//        cellUIView.backgroundColor = .systemGray3
//        let botConstraint = cellUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        botConstraint.priority = UILayoutPriority(999)
        NSLayoutConstraint.activate([
            cellUIView.heightAnchor.constraint(equalToConstant: 70),
            cellUIView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configureCellLabel() {
        cellUIView.addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.font = .systemFont(ofSize: 20, weight: .regular)
        cellLabel.numberOfLines = 0
        cellLabel.textColor = .black
        NSLayoutConstraint.activate([
            cellLabel.centerYAnchor.constraint(equalTo: cellUIView.centerYAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: cellUIView.leadingAnchor, constant: 10),
            cellLabel.trailingAnchor.constraint(equalTo: cellUIView.trailingAnchor, constant: -10)
        ])
    }
    
    func configureForCellForRowAt(cell: Category) {
        cellLabel.text = cell.name
    }
}
