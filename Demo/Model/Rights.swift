//
//  Rights.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Rights: Codable {

  enum CodingKeys: String, CodingKey {
    case label
  }

  var label: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    label = try container.decodeIfPresent(String.self, forKey: .label)
  }

}
