//
//  CardSideEditView.swift
//  Flashcards
//
//  Created by Юрий Истомин on 15/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit

enum CardSide {
    case front, back
}

class CardSideEditView: UIView {
    
    static let frontPlaceholder = "Front Side (Question)"
    static let backPlaceholder = "Back Side (Answer)"
    
    let side: CardSide
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = true
        textView.textColor = FlashcardsColors.lightGray
        textView.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        textView.setTranslatesAutoresizingMaskIntoConstraintsFalse()
        return textView
    }()
    
    init(side: CardSide) {
        self.side = side
        super.init(frame: .zero)
        
        setTranslatesAutoresizingMaskIntoConstraintsFalse()
        setWhiteBackgroundColor()
        setCornerRadius()
        
        addSubview(textView)
        setTextViewPlaceholder()
        setConstraintsForTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = BaseConstraints.cellCornerRadius
        layer.masksToBounds = true
    }
    
    private func setTextViewPlaceholder() {
        textView.text = side == .front ? CardSideEditView.frontPlaceholder : CardSideEditView.backPlaceholder
    }
    
    private func setConstraintsForTextView() {
        textView.leftAnchor.constraint(equalTo: leftAnchor, constant: BaseConstraints.largeMargin).isActive = true
        textView.topAnchor.constraint(equalTo: topAnchor, constant: BaseConstraints.largeMargin).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor, constant: -BaseConstraints.largeMargin).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -BaseConstraints.largeMargin).isActive = true
    }
    
}
