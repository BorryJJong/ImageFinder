//
//  SearchImageAPI.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import Foundation
import Alamofire

class SearchImageAPI {

  func doSearchImage(keyword: String) {
    let escapingString = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    let headers: HTTPHeaders = [ "Authorization": "KakaoAK 754d4ea04671ab9d7e2add279d718b0e" ]
    let URL = "https://dapi.kakao.com/v2/search/image?query=\(escapingString)"

    Alamofire.request(
      URL,
      method: .get,
      headers: headers
    ).responseData { response in
      switch response.result {
      case .success(let result):
        do {
          let getInstanceData = try JSONDecoder().decode(APIResponse.self, from: result)
          // self.delegate?.presentAddress(result: getInstanceData.documents)
          print(getInstanceData)
          print("hi")
        } catch {
          print(error.localizedDescription)
        }
      case .failure(let error):
        print(error)
      }
    }
  }
}
