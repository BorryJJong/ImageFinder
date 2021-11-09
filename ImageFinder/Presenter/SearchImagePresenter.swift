//
//  SearchImagePresenter.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import Foundation

protocol SearchImagePresenterDelegate: AnyObject {
  func presentResult(result: [Documents], isEnd: Bool)
}

class SearchImagePresenter {
  var searchImageService: SearchImageService
  weak var delegate: SearchImagePresenterDelegate?

  init(searchImageService: SearchImageService) {
    self.searchImageService = searchImageService
  }

  func setResultImage(keyword: String, page: Int) {
    self.searchImageService.getSearchedImage(keyword: keyword, page: page, callback: { response in
      let documents = response.documents
      let meta = response.meta
      self.delegate?.presentResult(result: documents, isEnd: meta.isEnd)
    })
  }
}
