//
//  File.swift
//  ImageFinder
//
//  Created by Daye on 2021/11/26.
//

import Foundation
import UIKit

extension UIView {
  func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
    clipsToBounds = true
    layer.cornerRadius = cornerRadius
    layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
  }
}
