//
//  UIColorExtension.swift
//  Flashcards
//
//  Created by Юрий Истомин on 12/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit

extension UIColor {
  public static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
    let maxColorValue: CGFloat = 255.0
    return UIColor(red: r/maxColorValue, green: g/maxColorValue, blue: b/maxColorValue, alpha: 1.0)
  }
}

enum FlashcardsColors {
  static let grayBackground = UIColor.rgb(239, 239, 244)
  static let greenSuccess = UIColor.rgb(76, 217, 100)
  static let redFailure = UIColor.rgb(255, 45, 85)
  static let blueButton = UIColor.rgb(0, 88, 183)
}
