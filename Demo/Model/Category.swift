//
//  Category.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Category: Codable {

  enum CodingKeys: String, CodingKey {
    case attributes
  }

  var attributes: Attributes?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
  }

}
