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
