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
    var name: String = "Noname"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    
    @Relationship(deleteRule: .cascade) var jobs: [Job]?
    var unwrappedJobs: [Job] {
        jobs ?? []
    }
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
