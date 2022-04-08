//
//  Im:price.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Imprice: Codable {

  enum CodingKeys: String, CodingKey {
    case attributes
    case label
  }

  var attributes: Attributes?
  var label: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
    label = try container.decodeIfPresent(String.self, forKey: .label)
  }

}
