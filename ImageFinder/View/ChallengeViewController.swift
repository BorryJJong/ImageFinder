//
//  ChallengeViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/11/12.
//

import UIKit

class ChallengeViewController: UIViewController {

  // MARK: - Properties

  var presenter: ChallengePresenter?

  // MARK: - UI

  let challengeTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .red
    return tableView
  }()

  // MARK: - Lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .yellow
      setView()
      layout()
    }

  // MARK: - Layout

  func setView() {
    navigationItem.title = "챌린지"
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
