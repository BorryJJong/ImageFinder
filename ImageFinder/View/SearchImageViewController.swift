//
//  ViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import UIKit

class SearchImageViewController: UIViewController {

  // MARK: - Properties

  static let cellID = "Cell"

  // MARK: - UI

  let imageSearchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    
    return searchBar
  }()

  let resultCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    flowLayout.scrollDirection = .vertical
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setView()
    layout()
  }

  // MARK: - Layout

  func setView() {
    view.backgroundColor = .white
    navigationController?.isNavigationBarHidden = true

    resultCollectionView.backgroundColor = .black
    resultCollectionView.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchImageViewController.cellID)
    resultCollectionView.dataSource = self
    resultCollectionView.delegate = self

    view.addSubview(imageSearchBar)
    view.addSubview(resultCollectionView)
  }

  func layout() {
    imageSearchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    imageSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    imageSearchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
    imageSearchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true

    resultCollectionView.topAnchor.constraint(equalTo: imageSearchBar.bottomAnchor, constant: 20).isActive = true
    resultCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
    resultCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    resultCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
  }
}

  // MARK: - Extenstions

extension SearchImageViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 18
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchImageViewController.cellID, for: indexPath) as? ResultCollectionViewCell else {
      return .init()
    }
    cell.backgroundColor = .red
    return cell
  }
}

extension SearchImageViewController: UICollectionViewDelegate {
}

extension SearchImageViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // view.frame.width - (20(3개의 cell 사이 공백) + 20(collectionView 양쪽 여백) + 20(collectionView와 cell 사이 여백))
    return CGSize(width: (view.frame.width - 60) / 3, height: (view.frame.width - 60) / 3)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }
}
