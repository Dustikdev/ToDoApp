//
//  toDoCell.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.12.2022.
//

import UIKit
import SwipeCellKit

class ToDoCell: SwipeTableViewCell {
    
    let cellUIView = UIView()
    let cellLabel = UILabel()
    let checkMark = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Constants.CellIndentificators.toDoCellIdentificator)
        configureToDoCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ToDoCell {
    
    func configureToDoCellUI() {
        configurecCellUIView()
        configureCheckMark()
        configureCellLabel()
    }
    
    func configurecCellUIView() {
        contentView.addSubview(cellUIView)
        cellUIView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellUIView.heightAnchor.constraint(equalToConstant: 70),
            cellUIView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
        ])
        
    }
    
    func configureCheckMark() {
        cellUIView.addSubview(checkMark)
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        checkMark.image = UIImage(systemName: "checkmark")
        checkMark.isHidden = true
        NSLayoutConstraint.activate([
            checkMark.heightAnchor.constraint(equalToConstant: 20),
            checkMark.widthAnchor.constraint(equalToConstant: 20),
            checkMark.centerYAnchor.constraint(equalTo: cellUIView.centerYAnchor),
            checkMark.trailingAnchor.constraint(equalTo: cellUIView.trailingAnchor, constant: -10)
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
            cellLabel.trailingAnchor.constraint(equalTo: cellUIView.trailingAnchor, constant: -40)
        ])
    }
    
    func configureForCellForRowAt(cell: Item, row: Int, count: Int) {
        cellLabel.textColor = .black
        cellLabel.text = cell.cellLabelText
        checkMark.isHidden = cell.checkMarkisHidden
        let gradientValue = row * (100/count)
        let color = UIColor(hex: cell.itemColor)?.darker(by: CGFloat(gradientValue))
        cellUIView.backgroundColor = color
        if gradientValue > 49 {
            cellLabel.textColor = .white
        }
    }
}
