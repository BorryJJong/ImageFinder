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
  weak var delegate: SearchImagePresenterDelegate?
  let imageSearchService: SearchImageAPI

  init(imageSearchService: SearchImageAPI){
    self.imageSearchService = imageSearchService
  }

  func setViewDelegate(delegate: SearchImageViewController) {
     self.delegate = delegate
   }
}
