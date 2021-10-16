//
//  APIResponse.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import Foundation

struct APIResponse: Codable {
  let documents: [Documents]
  let meta: Meta
}

