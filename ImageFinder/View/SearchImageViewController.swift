//
//  ViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import UIKit

class SearchImageViewController: UIViewController {

  // MARK: - UI

  let imageSearchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    
    return searchBar
  }()

  let resultCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

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

