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
  var searchImageService: SearchImageService
  weak var delegate: SearchImagePresenterDelegate?

  init(searchImageService: SearchImageService) {
    self.searchImageService = searchImageService
  }

  func setResultImage(keyword: String) {
    self.searchImageService.getSearchedImage(keyword: keyword, callback: { response in
      let documents = response.documents
      self.delegate?.presentResult(result: documents)
    })

  }
}
