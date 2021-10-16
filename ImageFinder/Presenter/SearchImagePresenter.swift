//
//  SearchImagePresenter.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import Foundation

protocol SearchImagePresenterDelegate: AnyObject {
  func presentResult(result: [Documents])
}

class SearchImagePresenter {
  let searchImageService: SearchImageService
//  weak var view: SearchImageViewController?
  weak var delegate: SearchImagePresenterDelegate?

  init(searchImageService: SearchImageService){
    self.searchImageService = searchImageService
  }
  
  func setViewDelegate(delegate: SearchImageViewController) {
     self.delegate = delegate
   }
}
