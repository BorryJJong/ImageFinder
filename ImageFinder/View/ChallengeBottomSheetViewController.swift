//
//  ChallengeBottomSheetViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/11/25.
//

import UIKit

class ChallengeBottomSheetViewController: UIViewController {
  // MARK: - Properties

  let sortMenuString = ["최신순", "인기순"]

  // MARK: - UI

  let dimmedView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
    return view
  }()

  let bottomSheetView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.roundCorners(cornerRadius: 25, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    return view
  }()

  let bottomSheetTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.separatorColor = .white
    tableView.register(ChallengeBottomSheetTableCell.classForCoder(), forCellReuseIdentifier: "cell2")
    tableView.allowsSelection = true
    return tableView
  }()
  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setView()
    layout()
  }
  // MARK: - Layout

  func setView() {
    bottomSheetTableView.dataSource = self
    view.addSubview(dimmedView)
    view.addSubview(bottomSheetView)
    bottomSheetView.addSubview(bottomSheetTableView)
  }

  func layout() {
    NSLayoutConstraint.activate([
      dimmedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      dimmedView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      dimmedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      dimmedView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),

      bottomSheetView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      bottomSheetView.heightAnchor.constraint(equalToConstant: 115),
      bottomSheetView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      bottomSheetView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

      bottomSheetTableView.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 15),
      bottomSheetTableView.rightAnchor.constraint(equalTo: bottomSheetView.rightAnchor),
      bottomSheetTableView.bottomAnchor.constraint(equalTo: bottomSheetView.safeAreaLayoutGuide.bottomAnchor),
      bottomSheetTableView.leftAnchor.constraint(equalTo: bottomSheetView.leftAnchor)
    ])
  }
}

extension ChallengeBottomSheetViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let challengeBottomSheetTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? ChallengeBottomSheetTableCell else {
      return .init()
    }
    let buttonLabel = sortMenuString[indexPath.row]
    challengeBottomSheetTableViewCell.setButtonLabel(label: buttonLabel)

    return challengeBottomSheetTableViewCell
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sortMenuString.count
  }
}
