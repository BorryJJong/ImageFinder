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

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .yellow
      view.addSubview(label)
      label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
      label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

  // MARK: - UI

  let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false

    label.text = "test.."
    return label
  }()

}
