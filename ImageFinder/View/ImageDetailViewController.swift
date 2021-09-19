//
//  ImageDetailViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/18.
//

import UIKit

class ImageDetailViewController: UIViewController, ImageDetailDelegate {

  // MARK: - Properties

  var imageUrl: URL?

  func getSelectedImage(imageUrl: URL) {
    self.imageUrl = imageUrl
  }

  // MARK: - UI
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: view.bounds)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.contentSize = imageView.bounds.size
    scrollView.backgroundColor = .yellow
//    scrollView.showsVerticalScrollIndicator = true
    return scrollView
  }()
  
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.backgroundColor = .blue
    imageView.image = UIImage(named: "jjong")
    return imageView
  }()
  
  let imageSourceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setView()
    layout()
  }
  
  func setView() {
    navigationController?.isNavigationBarHidden = false

    view.addSubview(scrollView)
    scrollView.addSubview(imageView)
    view.addSubview(imageSourceLabel)
    view.addSubview(dateLabel)
  }
  
  func layout() {
    scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true

    imageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
    imageView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
    imageView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor).isActive = true
    imageView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true

    imageSourceLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
    imageSourceLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
    
    dateLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
    dateLabel.bottomAnchor.constraint(equalTo: imageSourceLabel.topAnchor, constant: 2).isActive = true
  }
}
