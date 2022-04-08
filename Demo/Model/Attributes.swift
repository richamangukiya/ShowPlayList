//
//  Attributes.swift
//
//  Created by Richa Mangukiya on 08/04/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Attributes: Codable {
    
    enum CodingKeys: String, CodingKey {
        case label
        case href
    }
    
    var label: String?
    var href: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        label = try container.decodeIfPresent(String.self, forKey: .label)
        href = try container.decodeIfPresent(String.self, forKey: .href)
    }
    
}
