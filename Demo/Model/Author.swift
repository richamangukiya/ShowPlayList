//
//  Author.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Author: Codable {

  enum CodingKeys: String, CodingKey {
    case uri
    case name
  }

  var uri: Uri?
  var name: Name?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    uri = try container.decodeIfPresent(Uri.self, forKey: .uri)
    name = try container.decodeIfPresent(Name.self, forKey: .name)
  }

}
