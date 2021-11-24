//
//  ChallengeViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/11/12.
//

import UIKit

class ChallengeViewController: UIViewController {
  
  // MARK: - Properties
  
  let sampleThumnail: [String] = ["img_table_challenge_1", "img_table_challenge_2"]
  var presenter: ChallengePresenter?
  
  // MARK: - UI
  
  let challengeTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.separatorColor = .white
    tableView.register(ChallengeTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    return tableView
  }()
  
  let searchButton: UIBarButtonItem = {
    let button = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(buttonPressed(_:)))
    button.tintColor = .black
    return button
  }()

  let testLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "test"
    return label
  }()

  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setView()
    layout()
  }
  
  @objc private func buttonPressed(_ sender: Any) {
    print("button clicked")
  }
  
  // MARK: - Layout
  
  func setView() {
    navigationItem.title = "챌린지"
    navigationItem.rightBarButtonItem = searchButton
    challengeTableView.dataSource = self
    challengeTableView.delegate = self
    view.addSubview(challengeTableView)
  }
  
  func layout() {
    NSLayoutConstraint.activate([
      challengeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      challengeTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      challengeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      challengeTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
    ])
  }
}

extension ChallengeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let frame = tableView.frame

    let sortButton: UIButton = {
      let button = UIButton(frame: CGRect(x: frame.size.width - 74, y: 10, width: 54, height: 30))
      button.addTarget(self, action: #selector(ChallengeViewController.buttonPressed(_:)), for: .touchUpInside)
      button.setTitle("최신순", for: .normal)
      button.setImage(#imageLiteral(resourceName: "ic_table_sort"), for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 13)
      button.setTitleColor(.gray50, for: .normal)
      button.contentHorizontalAlignment = .center
      button.semanticContentAttribute = .forceRightToLeft
      return button
    }()
    let totalLabel: UILabel = {
      let label = UILabel(frame: CGRect(x: 20, y: 10, width: 50, height: 30))
      label.text = "총 10개"
      label.textColor = .green50
      label.font = .boldSystemFont(ofSize: 13)
      return label
    }()
    let newChallengeLabel: UILabel = {
//      let seperatorImage = NSTextAttachment()
//      seperatorImage.image = UIImage(named: "ic_table_sort")
//
//      let string = NSMutableAttributedString()
//      string.append(NSAttributedString(attachment: seperatorImage))
//      string.append(NSAttributedString(string: "신규 2개"))

      let label = UILabel(frame: CGRect(x: 75, y: 10, width: 65, height: 30))
      label.font = .systemFont(ofSize: 13)
      label.textColor = .gray90
      label.text = "신규 2개"
//      label.attributedText = string
      return label
    }()

    let challengeTableHeaderView: UIView = {
      let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
      view.addSubview(sortButton)
      view.addSubview(totalLabel)
      view.addSubview(newChallengeLabel)
      return view
    }()

    return challengeTableHeaderView
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
}

extension ChallengeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let challengeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChallengeTableViewCell else {
      return .init()
    }
    let imageName = sampleThumnail[indexPath.row]
    challengeTableViewCell.setImage(name: imageName)
    
    return challengeTableViewCell
  }
}
