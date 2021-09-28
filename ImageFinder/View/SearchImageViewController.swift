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
  var thumbnail: [String] = []
  let api = SearchImageAPI()
  let presenter = SearchImagePresenter()

  func getResult(result: [Documents]) {
    self.resultImages = result
    resultCollectionView.reloadData()
    print("got!")
    print(self.resultImages)
  }
  
  // MARK: - UI
  
  let imageSearchBar: UISearchController = {
    let searchBar = UISearchController()
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
//    presenter?.setViewDelegate(delegate: self)
//    api.doSearchImage(keyword: "너무나 귀여운 아기고릴라")
    setView()
    layout()
  }

  // MARK: - Layout
  
  func setView() {
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "이미지 검색"
    navigationItem.searchController = imageSearchBar
    
    resultCollectionView.backgroundColor = .gray
    resultCollectionView.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchImageViewController.cellID)
    resultCollectionView.dataSource = self
    resultCollectionView.delegate = self
    
    view.addSubview(resultCollectionView)
  }
  
  func layout() {
//    imageSearchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
//    imageSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//    imageSearchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
//    imageSearchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
    
    resultCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
    resultCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
    resultCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    resultCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
  }
}

// MARK: - Extenstions

extension SearchImageViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print(resultImages.count)
    return 15
//    return resultImages.count
    // return resultImages?.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchImageViewController.cellID, for: indexPath) as? ResultCollectionViewCell else {
      return UICollectionViewCell()
    }
    print(indexPath.row)
//    let urlString = resultImages[indexPath.row].thumbnailUrl
//
//    if let url = URL(string: urlString) {
//      if let data = try? Data(contentsOf: url) {
//        let image = UIImage(data: data)
//        cell.thumbnailView.image = image
//        print(urlString)
//      }
//    }
    cell.thumbnailView.image = UIImage(named: "jjong")
    // cell.label.text = "test test!"
    return cell
  }
}

extension SearchImageViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let imageDetailView = ImageDetailViewController() 

    imageDetailView.imageUrl = "jjong"
    navigationController?.pushViewController(imageDetailView, animated: true)

  }
}

extension SearchImageViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // view.frame.width - (5(3개의 cell 사이 공백(2.5*2)) + 40(collectionView와 view.frame 간 간격(20*2)) + 5(collectionView 내부 margin))
    return CGSize(width: (view.frame.width - 50) / 3, height: (view.frame.width - 50) / 3)
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
//extension URL {
//    /// Non-optional initializer with better fail output
//    public init(safeString string: String) {
//        guard let instance = URL(string: string) else {
//            fatalError("Unconstructable URL: \(string)")
//        }
//        self = instance
//    }
//}
