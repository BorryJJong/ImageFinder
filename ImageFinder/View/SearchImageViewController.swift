//
//  ViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import UIKit

protocol SearchImageApi {
  func doSearchImage(keyword: String)
}

class SearchImageViewController: UIViewController, SearchImagePresenterDelegate, UISearchControllerDelegate {
  
  // MARK: - Properties
  
  static let cellID = "Cell"
  var resultImages: [Documents] = []
  var thumbnail: [String] = []
  let presenter = SearchImagePresenter()

  func presentResult(result: [Documents]) {
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
    collectionView.setStatusView(status: "beforeSearch")
    return collectionView
  }()

  let searchLodingIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    return activityIndicator
  }()

  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.setViewDelegate(delegate: self)
    setView()
    layout()
  }

  // MARK: - Layout
  
  func setView() {
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "이미지 검색"
    navigationItem.searchController = imageSearchBar
    navigationItem.hidesSearchBarWhenScrolling = false
    
    resultCollectionView.backgroundColor = .red
    resultCollectionView.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchImageViewController.cellID)
    resultCollectionView.dataSource = self
    resultCollectionView.delegate = self

    imageSearchBar.searchBar.delegate = self
    
    view.addSubview(resultCollectionView)
    view.addSubview(searchLodingIndicator)
  }
  
  func layout() {
    resultCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
    resultCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
    resultCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    resultCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true

    searchLodingIndicator.center = view.center
  }
}

// MARK: - Extenstions

extension SearchImageViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if resultImages.count == 0 {
      resultCollectionView.setStatusView(status: "noResult")
    } else {
      collectionView.restore()
    }
    print(resultImages.count)
    return resultImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchImageViewController.cellID, for: indexPath) as? ResultCollectionViewCell else {
      return UICollectionViewCell()
    }
    print(indexPath.row)
    let urlString = resultImages[indexPath.row].thumbnailUrl

    if let url = URL(string: urlString) {
      if let data = try? Data(contentsOf: url) {
        let image = UIImage(data: data)
        print(data)
        cell.thumbnailView.image = image
        print(urlString)
      }
    }
//    cell.thumbnailView.image = UIImage(named: "jjong")
    return cell
  }
}

extension SearchImageViewController: UISearchBarDelegate {
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    print("heyhey")
    let time = DispatchTime.now() + .seconds(1)
    let keyword = searchBar.text ?? ""

    resultCollectionView.isHidden = true
    searchLodingIndicator.startAnimating()

    DispatchQueue.main.asyncAfter(deadline: time) {
      self.searchLodingIndicator.stopAnimating()
      self.resultCollectionView.isHidden = false
      self.presenter.api.doSearchImage(keyword: keyword)
      self.resultCollectionView.reloadData()
    }
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

extension UICollectionView {
  func setStatusView(status: String) {
    let statusView: UIView = {
      let view = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.width, height: self.bounds.height))

      return view
    }()

    let searchStatusImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.translatesAutoresizingMaskIntoConstraints = false
      if status == "beforeSearch" {
        imageView.image = UIImage(named: "search.svg")
      } else if status == "noResult" {
        imageView.image = UIImage(named: "noResult.svg")
      }
      return imageView
    }()

    let searchStatusLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .gray
      if status == "beforeSearch" {
        label.text = "검색어를 입력하세요"
      } else if status == "noResult" {
        label.text = "검색 결과가 없습니다"
      }
      return label
    }()

    statusView.addSubview(searchStatusLabel)
    statusView.addSubview(searchStatusImageView)

    searchStatusImageView.centerXAnchor.constraint(equalTo: statusView.centerXAnchor).isActive = true
    searchStatusImageView.centerYAnchor.constraint(equalTo: statusView.centerYAnchor, constant: -40).isActive = true

    searchStatusLabel.centerXAnchor.constraint(equalTo: statusView.centerXAnchor).isActive = true
    searchStatusLabel.topAnchor.constraint(equalTo: searchStatusImageView.bottomAnchor, constant: 20).isActive = true

    self.backgroundView = statusView
  }

  func restore() {
    self.backgroundView = nil
  }
}
