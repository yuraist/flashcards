//
//  NoDecksBackgroundView.swift
//  Flashcards
//
//  Created by Юрий Истомин on 11/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit

class NoDecksBackgroundView: UIView {
  
  let messageLabel: UILabel = {
    let label = UILabel()
    
    return label
  }()
  
  let createButton: UIButton = {
    let button = UIButton()
    
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
