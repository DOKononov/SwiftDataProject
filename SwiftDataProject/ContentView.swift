//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Dmitry Kononov on 16.09.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<User> { user in user.name.contains("3") },
        sort: \User.name) private var users: [User]
//    @State private var path: [User] = []
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
//            .navigationDestination(for: User.self) { user in
//                EditeUserView(user: user)
//            }
            .toolbar {
                Button("Add samples", systemImage: "plus") {
//                    let user = User(name: "", city: "", joinDate: .now)
//                    modelContext.insert(user)
//                    path = [user]
                    
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Test", city: "Test", joinDate: .now.addingTimeInterval(8640 * -10))
                    let second = User(name: "Test2", city: "Test2", joinDate: .now.addingTimeInterval(8640 * -5))
                    let third = User(name: "Test3", city: "Test3", joinDate: .now.addingTimeInterval(8640 * 5))
                    let fourth = User(name: "Test4", city: "Test4", joinDate: .now.addingTimeInterval(8640 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ContentView()
}
