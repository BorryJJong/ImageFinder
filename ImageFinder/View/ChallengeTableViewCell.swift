//
//  ChallengeTableViewCell.swift
//  ImageFinder
//
//  Created by Daye on 2021/11/15.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
  
  // MARK: Properties
  
  // MARK: UI
  
  let thumnailView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    //    view.backgroundColor = .green
    return view
  }()
  
  let thumnailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  let participateView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    return view
  }()
  
  let profileImages: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = imageView.bounds.height / 2
    imageView.image = UIImage(named: "profile")
    return imageView
  }()
  
  let participateMentLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "첫 번째 참여자가 되어보세요!"
    label.textColor = .green50
    label.font = UIFont.systemFont(ofSize: 13)
    return label
  }()
  
  let seperateLine: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .gray30
    return view
  }()
  
  let challengeContentsView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let challengeTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "#GOGO챌린지"
    label.font = UIFont.boldSystemFont(ofSize: 17)
    return label
  }()
  
  let challengeContentLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "쓰레기를 줄이자는 의미의 제로웨이스트 운동이 활발해 지고있다. 제로웨이스트에 대해 좀 더 알아보자!"
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 2
    label.textColor = .gray50
    label.font = UIFont.systemFont(ofSize: 13)
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
    contentView.addSubview(thumnailView)
    thumnailView.addSubview(thumnailImageView)
    thumnailView.addSubview(participateView)
    participateView.addSubview(profileImages)
    participateView.addSubview(participateMentLabel)
    contentView.addSubview(seperateLine)
    challengeContentsView.addSubview(challengeTitleLabel)
    challengeContentsView.addSubview(challengeContentLabel)
    contentView.addSubview(challengeContentsView)
    
  }
  
  func layout() {
    NSLayoutConstraint.activate([
      thumnailView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      thumnailView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
      thumnailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -97),
      thumnailView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      
      thumnailImageView.topAnchor.constraint(equalTo: thumnailView.topAnchor, constant: 0),
      thumnailImageView.rightAnchor.constraint(equalTo: thumnailView.rightAnchor, constant: 0),
      thumnailImageView.bottomAnchor.constraint(equalTo: thumnailView.bottomAnchor, constant: -38),
      thumnailImageView.leftAnchor.constraint(equalTo: thumnailView.leftAnchor, constant: 0),
      
      seperateLine.heightAnchor.constraint(equalToConstant: 1),
      seperateLine.topAnchor.constraint(equalTo: thumnailView.bottomAnchor, constant: 1),
      seperateLine.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
      seperateLine.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      
      participateView.heightAnchor.constraint(equalToConstant: 55),
      participateView.rightAnchor.constraint(equalTo: thumnailImageView.rightAnchor, constant: -70),
      participateView.bottomAnchor.constraint(equalTo: seperateLine.topAnchor, constant: -1),
      participateView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      
      profileImages.heightAnchor.constraint(equalToConstant: 22),
      profileImages.widthAnchor.constraint(equalToConstant: 25),
      profileImages.topAnchor.constraint(equalTo: participateView.topAnchor, constant: 14),
      profileImages.leftAnchor.constraint(equalTo: participateView.leftAnchor),
      
      participateMentLabel.topAnchor.constraint(equalTo: participateView.topAnchor, constant: 18),
      participateMentLabel.leftAnchor.constraint(equalTo: profileImages.rightAnchor, constant: 3),
      
      challengeContentsView.topAnchor.constraint(equalTo: seperateLine.bottomAnchor),
      challengeContentsView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
      challengeContentsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
      challengeContentsView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      
      challengeTitleLabel.topAnchor.constraint(equalTo: challengeContentsView.topAnchor, constant: 10),
      challengeTitleLabel.leftAnchor.constraint(equalTo: challengeContentsView.leftAnchor),
      
      challengeContentLabel.widthAnchor.constraint(equalTo: challengeContentsView.widthAnchor),
      challengeContentLabel.topAnchor.constraint(equalTo: challengeTitleLabel.bottomAnchor, constant: 5),
      challengeContentLabel.rightAnchor.constraint(equalTo: challengeContentLabel.rightAnchor),
      challengeContentLabel.leftAnchor.constraint(equalTo: challengeContentsView.leftAnchor)
    ])
  }
  
  func setImage(name: String) {
    thumnailImageView.image = UIImage(named: name)
  }
}
