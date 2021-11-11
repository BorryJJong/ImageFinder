//
//  SearchImageService.swift
//  ImageFinder
//
//  Created by Daye on 2021/10/15.
//

import Foundation
import Alamofire

enum SearchStatus: String {
  case searchBarEmpty
  case keywordTyping
  case searchSuccessed
  case searchFailed
}

struct SearchImageService {
  func getSearchedImage(keyword: String, page: Int, callback: @escaping (APIResponse) -> Void) {
    let escapingString = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    let headers: HTTPHeaders = [ "Authorization": "KakaoAK 754d4ea04671ab9d7e2add279d718b0e" ]
    let URL = "https://dapi.kakao.com/v2/search/image?query=\(escapingString)&size=\(30)&page=\(page)"

    Alamofire.request(
      URL,
      method: .get,
      headers: headers
    ).responseData { response in
      switch response.result {
      case .success(let result):
        do {
          let getInstanceData = try JSONDecoder().decode(APIResponse.self, from: result)
          callback(getInstanceData)
        } catch {
          print(error.localizedDescription)
        }
      case .failure(let error):
        print(error)
      }
    }
  }
}
