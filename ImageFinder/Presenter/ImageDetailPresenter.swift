//
//  ImageDetailViewPresenter.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/18.
//

import Foundation

protocol ImageDetailDelegate: AnyObject {
  func getSelectedImage(imageUrl: URL)
}

class ImageDetailPresenter {
  weak var delegate: ImageDetailDelegate?

  
}
