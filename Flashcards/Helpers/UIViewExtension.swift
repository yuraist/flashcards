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
  
}
