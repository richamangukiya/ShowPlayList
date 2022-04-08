//
//  BaseClass.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case feed
  }

  var feed: Feed?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    feed = try container.decodeIfPresent(Feed.self, forKey: .feed)
  }

}
