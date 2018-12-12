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
