//
//  Documents.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import Foundation

struct Documents: Codable {
  let thumbnailUrl: String
  let imageUrl: String
  let imageWidth: Int
  let imageHeigth: Int
  let displaySiteName: String
  let dateTime: Date
  
  enum CodingKeys: String, CodingKey {
    case thumbnailUrl = "thumbnail_url"
    case imageUrl = "image_url"
    case imageWidth = "width"
    case imageHeigth = "height"
    case displaySiteName = "display_sitename"
    case dateTime = "datetime"
  }
}
