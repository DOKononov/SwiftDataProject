//
//  User.swift
//  SwiftDataProject
//
//  Created by Dmitry Kononov on 16.09.25.
//

import Foundation
import SwiftData

@Model
final class User {
    var name: String
    var city: String
    var joinDate: Date
    
    @Relationship(deleteRule: .cascade) var jobs: [Job] = []
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
