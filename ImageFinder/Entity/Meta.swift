//
//  Meta.swift
//  ImageFinder
//
//  Created by Daye on 2021/10/15.
//

import Foundation

struct Meta: Codable {
  let totalCount: Int
  let pageableCount: Int
  let isEnd: Bool

  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case pageableCount = "pageable_count"
    case isEnd = "is_end"
  }
}
