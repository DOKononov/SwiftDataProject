//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Dmitry Kononov on 16.09.25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
