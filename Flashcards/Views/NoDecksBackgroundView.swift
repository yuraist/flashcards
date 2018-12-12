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
    label.text = "No Decks. Create a new one?"
    label.textAlignment = .center
    label.numberOfLines = 0
    label.textColor = FlashcardsColors.gray
    label.setTranslatesAutoresizingMaskIntoConstraintsFalse()
    return label
  }()
  
  let createButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Create", for: .normal)
    button.titleLabel!.font = UIFont.systemFont(ofSize: 17)
    button.contentHorizontalAlignment = .center
    button.setTranslatesAutoresizingMaskIntoConstraintsFalse()
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubviews(messageLabel, createButton)
    setConstraintsForSubviews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setConstraintsForSubviews() {
    messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    messageLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -8).isActive = true
    messageLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
    messageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    createButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    createButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16).isActive = true
    createButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    createButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
}
