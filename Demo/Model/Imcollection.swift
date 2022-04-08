//
//  Im:collection.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Imcollection: Codable {

  enum CodingKeys: String, CodingKey {
    case link
    case imname
    case imcontentType
  }

  var link: Link?
  var imname: Imname?
  var imcontentType: ImcontentType?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    link = try container.decodeIfPresent(Link.self, forKey: .link)
    imname = try container.decodeIfPresent(Imname.self, forKey: .imname)
    imcontentType = try container.decodeIfPresent(ImcontentType.self, forKey: .imcontentType)
  }

}
