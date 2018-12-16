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
    
    setNavigationBarButtonItem()
    setGrayBackgroundColor()
    addSubviews()
    setConstraintsForSubviews()
    setTextViewsDelegates()
    setupViewModelBinding()
  }
  
  private func setNavigationBarButtonItem() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDeck))
    navigationItem.rightBarButtonItem!.isEnabled = false
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
  
  private func setTextViewsDelegates() {
    frontCardSideView.textView.delegate = self
    backCardSideView.textView.delegate = self
  }
  
  private func setupViewModelBinding() {
    viewModel.frontCardSideText.bind { [unowned self] (text) in
      if text.count > 0 && self.viewModel.backCardSideText.value.count > 0 {
        self.showAddButton()
        self.enableSaveBarButtonItem()
      } else {
        self.hideAddButton()
        self.disableSaveBarButtonItem()
      }
    }
    
    viewModel.backCardSideText.bind { [unowned self] (text) in
      if text.count > 0 && self.viewModel.frontCardSideText.value.count > 0 {
        self.showAddButton()
        self.enableSaveBarButtonItem()
      } else {
        self.hideAddButton()
        self.disableSaveBarButtonItem()
      }
    }
  }
  
  private func showAddButton() {
    saveAndAddOneMoreCardButton.isHidden = false
  }
  
  private func hideAddButton() {
    saveAndAddOneMoreCardButton.isHidden = true
  }
  
  private func enableSaveBarButtonItem() {
    navigationItem.rightBarButtonItem?.isEnabled = true
  }
  
  private func disableSaveBarButtonItem() {
    navigationItem.rightBarButtonItem?.isEnabled = false
  }
  
  @objc func saveDeck() {
    viewModel.saveCard()
    viewModel.saveDeck()
    dismiss(animated: true, completion: nil)
  }
}

extension AddCardViewController: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == FlashcardsColors.lightGray {
      textView.text = nil
      textView.textColor = FlashcardsColors.black
    }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      setPlaceholder(toTextView: textView)
    } else {
      if textView.isEqual(frontCardSideView.textView) {
        viewModel.updateFrontCardSideText(withString: textView.text)
      } else {
        viewModel.updateBackCardSideText(withString: textView.text)
      }
    }
  }
  
  func setPlaceholder(toTextView textView: UITextView) {
    textView.textColor = FlashcardsColors.lightGray
    
    if textView.isEqual(frontCardSideView.textView) {
      textView.text = CardSideEditView.frontPlaceholder
    } else {
      textView.text = CardSideEditView.backPlaceholder
    }
  }
}
