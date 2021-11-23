//
//  UILabel.swift
//  ImageFinder
//
//  Created by Daye on 2021/11/23.
//

import Foundation
import UIKit

public protocol TypographyExtensions: UILabel {
  var lineHeight: CGFloat? { get set }
}

extension UILabel: TypographyExtensions {
  public var lineHeight: CGFloat? {
    get { nil }
    set {
      let lineHeight = newValue ?? font.lineHeight
      let baselineOffset = (lineHeight - font.lineHeight) / 2.0 / 2.0
      let mutableParagraphStyle = NSMutableParagraphStyle()

      mutableParagraphStyle.minimumLineHeight = lineHeight
      mutableParagraphStyle.maximumLineHeight = lineHeight

      attributedText = NSAttributedString(
        string: text ?? "",
        attributes: [
          .baselineOffset: baselineOffset,
          .paragraphStyle: mutableParagraphStyle
        ]
      )
    }
  }
}
