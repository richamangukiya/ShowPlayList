//
//  Entry.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Entry: Codable {

  enum CodingKeys: String, CodingKey {
    case imartist = "im:artist"
    case id
    case link
    case imcollection = "im:collection"
    case rights
    case imcontentType = "im:contentType"
    case imprice = "im:price"
    case category
    case imimage = "im:image"
    case title
    case imname = "im:name"
    case imreleaseDate = "im:releaseDate"
  }

  var imartist: Imartist?
  var id: Id?
  var link: [Link]?
  var imcollection: Imcollection?
  var rights: Rights?
  var imcontentType: ImcontentType?
  var imprice: Imprice?
  var category: Category?
  var imimage: [Imimage]?
  var title: Title?
  var imname: Imname?
  var imreleaseDate: ImreleaseDate?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    imartist = try container.decodeIfPresent(Imartist.self, forKey: .imartist)
    id = try container.decodeIfPresent(Id.self, forKey: .id)
    link = try container.decodeIfPresent([Link].self, forKey: .link)
    imcollection = try container.decodeIfPresent(Imcollection.self, forKey: .imcollection)
    rights = try container.decodeIfPresent(Rights.self, forKey: .rights)
    imcontentType = try container.decodeIfPresent(ImcontentType.self, forKey: .imcontentType)
    imprice = try container.decodeIfPresent(Imprice.self, forKey: .imprice)
    category = try container.decodeIfPresent(Category.self, forKey: .category)
    imimage = try container.decodeIfPresent([Imimage].self, forKey: .imimage)
    title = try container.decodeIfPresent(Title.self, forKey: .title)
    imname = try container.decodeIfPresent(Imname.self, forKey: .imname)
    imreleaseDate = try container.decodeIfPresent(ImreleaseDate.self, forKey: .imreleaseDate)
  }

}
