//
//  ChallengeTableViewCell.swift
//  ImageFinder
//
//  Created by Daye on 2021/11/15.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {

  // MARK: Properties

  let sampleThumnail: [UIImage] = [UIImage(named: "img_table_challenge_1")!, UIImage(named: "img_table_challenge_2")!]

  // MARK: UI

  let thumnailView: UIView = {
    let view = UIView()
    return view
  }()

  let thumnailImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()

  let participateView: UIView = {
    let view = UIView()
    return view
  }()

  let profileImages: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()

  let participateMentLabel: UILabel = {
    let label = UILabel()
    label.text = "첫 번째 참여자가 되어보세요!"
    return label
  }()

  let seperateLine: UIView = {
    let view = UIView()
    view.backgroundColor = .gray30
    return view
  }()

  let challengeContentsView: UIView = {
    let view = UIView()
    return view
  }()

  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "test title~~"
    return label
  }()

  let contentTextField: UITextView = {
    let textView = UITextView()
    textView.text = "testsetstsetstsetsetsetset"
    return textView
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
    contentView.addSubview(thumnailView)
    thumnailView.addSubview(thumnailImageView)
    thumnailView.addSubview(participateView)
    participateView.addSubview(profileImages)
    participateView.addSubview(participateMentLabel)
    contentView.addSubview(seperateLine)
    contentView.addSubview(challengeContentsView)
    challengeContentsView.addSubview(titleLabel)
    challengeContentsView.addSubview(contentTextField)
  }

  func layout() {

  }


}
