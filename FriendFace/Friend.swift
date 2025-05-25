//
//  Friend.swift
//  FriendFace
//
//  Created by Kiran Shrestha on 5/24/25.
//

import Foundation

struct Friend: Codable, Hashable {
    enum CodingKeys: CodingKey {
        case id
        case name
    }
    
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
