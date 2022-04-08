//
//  Feed.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Feed: Codable {

  enum CodingKeys: String, CodingKey {
    case rights
    case icon
    case updated
    case id
    case author
    case title
    case link
    case entry
  }

  var rights: Rights?
  var icon: Icon?
  var updated: Updated?
  var id: Id?
  var author: Author?
  var title: Title?
  var link: [Link]?
  var entry: [Entry]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    rights = try container.decodeIfPresent(Rights.self, forKey: .rights)
    icon = try container.decodeIfPresent(Icon.self, forKey: .icon)
    updated = try container.decodeIfPresent(Updated.self, forKey: .updated)
    id = try container.decodeIfPresent(Id.self, forKey: .id)
    author = try container.decodeIfPresent(Author.self, forKey: .author)
    title = try container.decodeIfPresent(Title.self, forKey: .title)
    link = try container.decodeIfPresent([Link].self, forKey: .link)
    entry = try container.decodeIfPresent([Entry].self, forKey: .entry)
  }

}
