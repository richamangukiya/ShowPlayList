//
//  MemberInfo.swift
//
//  Created by Richa Mangukiya on 02/03/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MemberInfo: Codable {

  enum CodingKeys: String, CodingKey {
    case isLeft = "is_left"
    case childId = "child_id"
    case isOnline = "is_online"
    case isAdmin = "is_admin"
    case createdOn = "created_on"
    case onlineAt = "online_at"
    case groupId = "group_id"
    case userId = "user_id"
    case isBlocked = "is_blocked"
    case notificationPreference = "notification_preference"
    case id
  }

  var isLeft: String?
  var childId: String?
  var isOnline: String?
  var isAdmin: String?
  var createdOn: String?
  var onlineAt: String?
  var groupId: String?
  var userId: String?
  var isBlocked: String?
  var notificationPreference: String?
  var id: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    isLeft = try container.decodeIfPresent(String.self, forKey: .isLeft)
    childId = try container.decodeIfPresent(String.self, forKey: .childId)
    isOnline = try container.decodeIfPresent(String.self, forKey: .isOnline)
    isAdmin = try container.decodeIfPresent(String.self, forKey: .isAdmin)
    createdOn = try container.decodeIfPresent(String.self, forKey: .createdOn)
    onlineAt = try container.decodeIfPresent(String.self, forKey: .onlineAt)
    groupId = try container.decodeIfPresent(String.self, forKey: .groupId)
    userId = try container.decodeIfPresent(String.self, forKey: .userId)
    isBlocked = try container.decodeIfPresent(String.self, forKey: .isBlocked)
    notificationPreference = try container.decodeIfPresent(String.self, forKey: .notificationPreference)
    id = try container.decodeIfPresent(String.self, forKey: .id)
  }

}
