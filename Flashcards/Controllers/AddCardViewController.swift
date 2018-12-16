//
//  AddCardCollectionViewController.swift
//  Flashcards
//
//  Created by Юрий Истомин on 02/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {
  
  var viewModel: NewDeckViewModel!
  
  let frontCardSideView = CardSideEditView(side: .front)
  let backCardSideView = CardSideEditView(side: .back)
  
  let saveAndAddOneMoreCardButton: UIButton = {
    let button = UIButton()
    button.setTitle("Save and Add one more", for: .normal)
    button.setTitleColor(FlashcardsColors.white, for: .normal)
    button.backgroundColor = FlashcardsColors.blueButton
    button.layer.cornerRadius = BaseConstraints.buttonCornerRadius
    button.layer.masksToBounds = true
    button.isHidden = true
    button.setTranslatesAutoresizingMaskIntoConstraintsFalse()
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setGrayBackgroundColor()
    addSubviews()
    setConstraintsForSubviews()
  }
  
  private func setGrayBackgroundColor() {
    view.setGrayBackgroundColor()
  }
  
  private func addSubviews() {
    view.addSubviews(frontCardSideView, backCardSideView, saveAndAddOneMoreCardButton)
  }
  
  private func setConstraintsForSubviews() {
    saveAndAddOneMoreCardButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
    saveAndAddOneMoreCardButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                        constant: -BaseConstraints.largeMargin).isActive = true
    saveAndAddOneMoreCardButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
    saveAndAddOneMoreCardButton.heightAnchor.constraint(equalToConstant: BaseConstraints.buttonHeight).isActive = true
    
    backCardSideView.leftAnchor.constraint(equalTo: saveAndAddOneMoreCardButton.leftAnchor).isActive = true
    backCardSideView.bottomAnchor.constraint(equalTo: saveAndAddOneMoreCardButton.topAnchor,
                                             constant: -BaseConstraints.largeMargin).isActive = true
    backCardSideView.topAnchor.constraint(equalTo: frontCardSideView.bottomAnchor, constant: BaseConstraints.largeMargin).isActive = true
    backCardSideView.rightAnchor.constraint(equalTo: saveAndAddOneMoreCardButton.rightAnchor).isActive = true
    backCardSideView.heightAnchor.constraint(equalTo: frontCardSideView.heightAnchor).isActive = true
    
    frontCardSideView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
    frontCardSideView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: BaseConstraints.largeMargin).isActive = true
    frontCardSideView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
    frontCardSideView.heightAnchor.constraint(equalTo: backCardSideView.heightAnchor).isActive = true
  }
}

extension AddCardViewController: UITextViewDelegate {
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    
    return true
  }
}
