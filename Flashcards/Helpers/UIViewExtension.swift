//
//  UIViewExtension.swift
//  Flashcards
//
//  Created by Юрий Истомин on 12/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func setTranslatesAutoresizingMaskIntoConstraintsFalse() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setWhiteBackgroundColor() {
        backgroundColor = FlashcardsColors.white
    }
    
    func setGrayBackgroundColor() {
        backgroundColor = FlashcardsColors.grayBackground
    }
    
}

enum BaseConstraints {
    static let largeMargin:   CGFloat = 16
    static let mediumMargin:  CGFloat = 8
    static let smallMargin:   CGFloat = 4
    
    static let largeTextHeight:     CGFloat = 30
    static let standardTextHeight:  CGFloat = 20
    
    static let cellCornerRadius:    CGFloat = 5
    static let buttonCornerRadius:  CGFloat = 25
    
    static let buttonHeight: CGFloat = 50
}
