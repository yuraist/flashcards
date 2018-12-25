//
//  DeckCollectionViewCell.swift
//  Flashcards
//
//  Created by Юрий Истомин on 15/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit

class DeckCollectionViewCell: UICollectionViewCell {
    
    let cellNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.setTranslatesAutoresizingMaskIntoConstraintsFalse()
        return label
    }()
    
    let numberOfCardsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = FlashcardsColors.gray
        label.setTranslatesAutoresizingMaskIntoConstraintsFalse()
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setCornerRadius()
        setWhiteBackgroundColor()
        addSubviews(cellNameLabel, numberOfCardsLabel)
        setConstraintsForSubviews()
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = BaseConstraints.cellCornerRadius
        layer.masksToBounds = true
    }
    
    private func setConstraintsForSubviews() {
        cellNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: BaseConstraints.largeMargin).isActive = true
        cellNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: BaseConstraints.largeMargin).isActive = true
        cellNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -BaseConstraints.largeMargin).isActive = true
        cellNameLabel.heightAnchor.constraint(equalToConstant: BaseConstraints.largeTextHeight).isActive = true
        
        numberOfCardsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: BaseConstraints.largeMargin).isActive = true
        numberOfCardsLabel.topAnchor.constraint(equalTo: cellNameLabel.bottomAnchor, constant: BaseConstraints.smallMargin).isActive = true
        numberOfCardsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -BaseConstraints.largeMargin).isActive = true
        numberOfCardsLabel.heightAnchor.constraint(equalToConstant: BaseConstraints.standardTextHeight).isActive = true
    }
    
}
