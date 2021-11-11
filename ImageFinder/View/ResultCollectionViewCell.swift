//
//  ResultImageCollectionViewCell.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import Foundation
import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
  
  // MARK: - UI
  
  let thumbnailView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    contentView.backgroundColor = .brown
    contentView.addSubview(thumbnailView)
    layout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Layout

  func layout() {
    thumbnailView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    thumbnailView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
    thumbnailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    thumbnailView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
  }
  
}
