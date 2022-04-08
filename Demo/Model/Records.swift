//
//  Records.swift
//
//  Created by Richa Mangukiya on 13/12/21
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Records: Codable {

  enum CodingKeys: String, CodingKey {
    case weight
    case weightlbs
    case recordDate = "record_date"
    case totalweak
    case weightType = "weight_type"
    case days
  }

  var weight: String?
  var weightlbs: String?
  var recordDate: String?
  var totalweak: String?
  var weightType: String?
  var days: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    weight = try container.decodeIfPresent(String.self, forKey: .weight)
    weightlbs = try container.decodeIfPresent(String.self, forKey: .weightlbs)
    recordDate = try container.decodeIfPresent(String.self, forKey: .recordDate)
    totalweak = try container.decodeIfPresent(String.self, forKey: .totalweak)
    weightType = try container.decodeIfPresent(String.self, forKey: .weightType)
    days = try container.decodeIfPresent(Int.self, forKey: .days)
  }

}
