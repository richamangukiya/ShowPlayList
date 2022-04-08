//
//  Im:releaseDate.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ImreleaseDate: Codable {

  enum CodingKeys: String, CodingKey {
    case label
    case attributes
  }

  var label: String?
  var attributes: Attributes?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    label = try container.decodeIfPresent(String.self, forKey: .label)
    attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
  }

}
