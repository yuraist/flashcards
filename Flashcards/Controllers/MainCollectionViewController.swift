//
//  MainCollectionViewController.swift
//  Flashcards
//
//  Created by Юрий Истомин on 02/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit
import CoreData

class MainCollectionViewController: UICollectionViewController {
  
  private let cellId = "deckCell"
  private let viewModel = DecksViewModel()
  
  private let noDecksBackgroundView = NoDecksBackgroundView(frame: .zero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTabBar()
    
    setCollectionViewBackgroundColor()
    addCollectionViewBackgroundView()
    addActionToBackgroundButton()
    hideBackgroundViewIfDecksCountIsMoreThanZero()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    updateCollectionViewLayout()
  }
  
  private func updateCollectionViewLayout() {
    collectionView.collectionViewLayout.invalidateLayout()
  }
  
  private func setupTabBar() {
    if let mainTabBarItem = tabBarController?.tabBar.items?.first {
      mainTabBarItem.image = UIImage(named: "cards")?.withRenderingMode(.alwaysTemplate)
    }
    
    if let profileTabBarItem = tabBarController?.tabBar.items?.last {
      profileTabBarItem.image = UIImage(named: "profile")?.withRenderingMode(.alwaysTemplate)
    }
  }
  
  private func setCollectionViewBackgroundColor() {
    collectionView.setGrayBackgroundColor()
  }
 
  private func addCollectionViewBackgroundView() {
    collectionView.backgroundView = noDecksBackgroundView
  }
  
  private func addActionToBackgroundButton() {
    noDecksBackgroundView.createButton.addTarget(self, action: #selector(createNewDeck), for: .touchUpInside)
  }
  
  @objc func createNewDeck() {
    performSegue(withIdentifier: "showNewDeckController", sender: self)
  }
  
  private func hideBackgroundViewIfDecksCountIsMoreThanZero() {
    noDecksBackgroundView.isHidden = viewModel.decks.count > 0
  }
}

// MARK: - UICollectionViewDataSource

extension MainCollectionViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.decks.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DeckCollectionViewCell
    
    let deck = viewModel.decks[indexPath.item]
    
    cell.cellNameLabel.text = deck.name
    cell.numberOfCardsLabel.text = "\(deck.cards.count) cards"
    
    return cell
  }
  
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.size.width - 32, height: 85)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
}
