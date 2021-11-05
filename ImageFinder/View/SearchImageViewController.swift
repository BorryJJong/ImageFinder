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
  var resultImages: [Documents] = [] {
    didSet {
      resultCollectionView.reloadData()
    }
  }
  var isResultEnd: Bool = false {
    didSet {
      resultCollectionView.reloadData()
    }
  }
  var page: Int = 1
  var presenter: SearchImagePresenter?

  func presentResult(result: [Documents], isEnd: Bool) {
    self.resultImages = result
    self.isResultEnd = isEnd
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

  let searchLodingIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    return activityIndicator
  }()

  let statusView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let searchStatusImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  let searchStatusLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .gray
    return label
  }()

  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.delegate = self
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

    setStatusView(status: .searchBarEmpty)
    
    resultCollectionView.backgroundColor = .white
    resultCollectionView.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchImageViewController.cellID)
    resultCollectionView.dataSource = self
    resultCollectionView.delegate = self

    imageSearchBar.searchBar.delegate = self

    view.addSubview(resultCollectionView)
    view.addSubview(statusView)
    view.addSubview(searchLodingIndicator)
    statusView.addSubview(searchStatusLabel)
    statusView.addSubview(searchStatusImageView)
  }
  
  func layout() {
    resultCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
    resultCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
    resultCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    resultCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true

    statusView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    statusView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    statusView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
    statusView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true

    searchStatusImageView.centerXAnchor.constraint(equalTo: statusView.centerXAnchor).isActive = true
    searchStatusImageView.centerYAnchor.constraint(equalTo: statusView.centerYAnchor, constant: -60).isActive = true

    searchStatusLabel.centerXAnchor.constraint(equalTo: statusView.centerXAnchor).isActive = true
    searchStatusLabel.topAnchor.constraint(equalTo: searchStatusImageView.bottomAnchor, constant: 20).isActive = true

    searchLodingIndicator.center = view.center
  }

  func setStatusView(status: SearchStatus) {
    statusView.isHidden = false

    switch status {
    case .searchBarEmpty:
      self.searchStatusImageView.image = UIImage(named: "search.svg")
      self.searchStatusLabel.text = "검색어를 입력하세요"
    case .kewordTyping: break
    case .searchSuccessed:
      statusView.isHidden = true
    case .searchFailed:
      self.searchStatusImageView.image = UIImage(named: "noResult.svg")
      self.searchStatusLabel.text = "검색 결과가 없습니다"
    }
  }
}

// MARK: - Extenstions

extension SearchImageViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if resultImages.count == 0 && imageSearchBar.isActive {
      setStatusView(status: .searchFailed)
    } else {
      collectionView.reloadData()
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

    DispatchQueue.global().async {
      if let url = URL(string: urlString) {
        if let data = try? Data(contentsOf: url) {
          let image = UIImage(data: data)
          DispatchQueue.main.async {
            cell.thumbnailView.image = image // 이미지셋팅
          }
        }
      }
    }
    return cell
  }
}

extension SearchImageViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    statusView.isHidden = true
    searchLodingIndicator.startAnimating()
  }

  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    print(1)
    let time = DispatchTime.now() + .seconds(1)
    let keyword = searchBar.text ?? ""

    DispatchQueue.main.asyncAfter(deadline: time) {
      self.searchLodingIndicator.stopAnimating()
      self.resultCollectionView.isHidden = false
      self.presenter?.setResultImage(keyword: keyword, page: self.page)
    }
  }
}

extension SearchImageViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let imageDetailView = ImageDetailViewController()

    let urlString = resultImages[indexPath.row].imageUrl
    let rowDateTime = resultImages[indexPath.row].dateTime
    let imageSource = resultImages[indexPath.row].displaySiteName

    if let url = URL(string: urlString) {
      if let data = try? Data(contentsOf: url) {
        let image = UIImage(data: data)
        print(data)
        imageDetailView.imageView.image = image
      }
    }
    imageDetailView.dateLabel.text = rowDateTime
    imageDetailView.imageSourceLabel.text = imageSource

    navigationController?.pushViewController(imageDetailView, animated: true)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let height = scrollView.frame.height
    let contentSizeHeight = scrollView.contentSize.height
    let offset = scrollView.contentOffset.y
    let reachedBottom = (offset + height == contentSizeHeight)

    if reachedBottom {
      scrollViewDidReachBottom(scrollView)
    }
  }

  func scrollViewDidReachBottom(_ scrollView: UIScrollView) {
    if !isResultEnd {
      page += 1
      presenter?.setResultImage(keyword: imageSearchBar.searchBar.text ?? "", page: page)
    }
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
