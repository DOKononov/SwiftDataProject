//
//  Job.swift
//  SwiftDataProject
//
//  Created by Dmitry Kononov on 17.09.25.
//

import Foundation
import SwiftData

@Model
final class Job {
    var name: String = "Noname"
    var priority: Int = 1
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
