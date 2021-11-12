//
//  ImageDetailViewController.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/18.
//

import UIKit

class ImageDetailViewController: UIViewController {

  // MARK: - UI
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: view.bounds)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = .white
    scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: UIScreen.main.bounds.height * 1.5)
        scrollView.showsVerticalScrollIndicator = true
    return scrollView
  }()

  let contentsView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
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

  // MARK: - Layout

  func setView() {
    navigationController?.isNavigationBarHidden = false
    view.addSubview(scrollView)
    scrollView.addSubview(contentsView)
    contentsView.addSubview(imageView)
    contentsView.addSubview(imageSourceLabel)
    contentsView.addSubview(dateLabel)
  }
  
  func layout() {
    scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    contentsView.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
    contentsView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    contentsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    contentsView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 40).isActive = true

    imageView.topAnchor.constraint(equalTo: contentsView.topAnchor).isActive = true
    imageView.widthAnchor.constraint(equalTo: contentsView.widthAnchor).isActive = true
    imageView.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true

    imageSourceLabel.leftAnchor.constraint(equalTo: contentsView.leftAnchor, constant: 5).isActive = true
    imageSourceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
    
    dateLabel.leftAnchor.constraint(equalTo: contentsView.leftAnchor, constant: 5).isActive = true
    dateLabel.topAnchor.constraint(equalTo: imageSourceLabel.bottomAnchor, constant: 2).isActive = true
  }
}
