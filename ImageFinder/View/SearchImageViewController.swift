//
//  ViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import UIKit

class SearchImageViewController: UIViewController, SearchImagePresenterDelegate {

  // MARK: - Properties

  static let cellID = "Cell"
  var resultImages: [Documents] = []
  var thumbnail: [String]?
  let api = SearchImageAPI()

  func getResult(result: [Documents]) {
    self.resultImages = result
  }

  // MARK: - UI

  let imageSearchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()

  let resultCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout.init()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    flowLayout.scrollDirection = .vertical
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    api.doSearchImage(keyword: "qukka")
    setView()
    layout()
  }

  // MARK: - Layout

  func setView() {
    view.backgroundColor = .white
    navigationController?.isNavigationBarHidden = true

    resultCollectionView.backgroundColor = .gray
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
    return 9
    // return resultImages?.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchImageViewController.cellID, for: indexPath) as? ResultCollectionViewCell else {
      return UICollectionViewCell()
    }
//    let thumbnailUrl = URL(string: "https://t1.daumcdn.net/news/202109/01/moneyweek/20210901092029403pgth.jpg")
//    let data = try? Data(contentsOf: thumbnailUrl!)

//    guard let thumbnailUrl = URL(string: resultImages[indexPath.row].thumbnailUrl), ((try? Data(contentsOf: thumbnailUrl)) != nil)
//      else { return }
//    if let thumbnailUrl = URL(string: resultImages[indexPath.row].thumbnailUrl ) as? String {
//      let url = URL(string: thumbnailUrl)
//      if let url = url {
//
//      }
//    }

//    guard let thumbnailData = try? Data(contentsOf: thumbnailUrl)

//    if let urlString = resultImages?[indexPath.row].thumbnailUrl,
//           let url = URL(string: urlString) {
//      cell.thumbnailView.
//           }

//    if let thumbnailImage = UIImage(data: thumbnailData!) {
//      cell.thumbnailView.image = thumbnailImage
//    } else {
//      cell.thumbnailView.image = UIImage(named: "jjong")
//    }

    cell.thumbnailView.image = UIImage(named: "jjong")

    return cell
  }
}

extension SearchImageViewController: UICollectionViewDelegate {
}

extension SearchImageViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // view.frame.width - (5(3개의 cell 사이 공백(2.5*2)) + 20(collectionView와 view.frame 간 간격(10*2)) + 5(collectionView 내부 margin))
    return CGSize(width: (view.frame.width - 30) / 3, height: (view.frame.width - 30) / 3)
  }

  // 셀 간 상하 간격
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 2.5
  }

  // 셀 간 좌우 간격
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 2.5
  }

  // collectionView internal margin
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5)
  }
}
