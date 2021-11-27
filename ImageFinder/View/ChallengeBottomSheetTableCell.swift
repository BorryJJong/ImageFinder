//
//  ChallengeBottomSheetTableCell.swift
//  ImageFinder
//
//  Created by Daye on 2021/11/26.
//

import Foundation
import UIKit

class ChallengeBottomSheetTableCell: UITableViewCell {

  // MARK: UI

  let sortMenuLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 15)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setView()
    layout()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: Layout

  func setView() {
    contentView.addSubview(sortMenuLabel)
  }

  func layout() {
    NSLayoutConstraint.activate([
      sortMenuLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 15),
      sortMenuLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -14),
      sortMenuLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20)
    ])
  }

  func setButtonLabel(label: String) {
    self.sortMenuLabel.text = label
  }
}
