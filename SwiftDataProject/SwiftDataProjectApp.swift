//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Dmitry Kononov on 16.09.25.
//

import SwiftUI
import SwiftData


let config = ModelConfiguration(for: User.self)
let container = try! ModelContainer(for: User.self, configurations: config)

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
    
}
