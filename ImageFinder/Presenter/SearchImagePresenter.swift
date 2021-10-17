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
  var searchImageService: SearchImageService // A 주소값
  weak var delegate: SearchImagePresenterDelegate?

  init(searchImageService: SearchImageService) {
    self.searchImageService = searchImageService
  }

  func setImage(keyword: String) {
    self.searchImageService.getSearchedImage(keyword: keyword) { response in
      let result = response.documents
      self.delegate?.presentResult(result: result)
    }
  }
}
