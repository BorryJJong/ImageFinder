//
//  ResultImageCollectionViewCell.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import Foundation
import UIKit

class ResultCollectionViewCell: UICollectionViewCell {

  // MARK: Properties

  // MARK: - UI

  let thumbnailView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
//    imageView.image = UIImage(data: data!)
    return imageView
  }()

  let label: UILabel = {
    let label = UILabel()
    label.text = "test"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: .zero)

    contentView.backgroundColor = .brown
    contentView.addSubview(thumbnailView)
    contentView.addSubview(label)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func layout() {
    label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true

    thumbnailView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    thumbnailView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
    thumbnailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    thumbnailView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
  }

}
