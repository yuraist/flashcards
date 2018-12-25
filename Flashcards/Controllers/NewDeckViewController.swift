//
//  NewDeckViewController.swift
//  Flashcards
//
//  Created by Юрий Истомин on 02/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit

class NewDeckViewController: UIViewController {
    
    let viewModel = NewDeckViewModel()
    
    @IBOutlet weak var deckNameTextField: UITextField!
    @IBOutlet weak var nextBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFieldDelegate()
        setupViewModelBinding()
    }
    
    private func setTextFieldDelegate() {
        deckNameTextField.delegate = self
    }
    
    private func setupViewModelBinding() {
        viewModel.deckName.bind { [unowned self] (name) in
            self.deckNameTextField.text = name
            
            self.checkNextButtonIsEnabled()
        }
    }
    
    private func checkNextButtonIsEnabled() {
        nextBarButtonItem.isEnabled = viewModel.hasValidDeckName
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension NewDeckViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        viewModel.update(deckName: newString)
        
        return false
    }
}

extension NewDeckViewController {
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        viewModel.createDeck()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationController = segue.destination as? AddCardViewController {
            destinationController.viewModel = viewModel
        }
    }
}
