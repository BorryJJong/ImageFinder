//
//  SearchImagePresenter.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import Foundation

protocol SearchImagePresenterDelegate: AnyObject {
  func getResult(result: [Documents])
}

class SearchImagePresenter {
  weak var delegate: SearchImagePresenterDelegate?
  
}
