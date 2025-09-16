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
    @Query(sort: \User.name) private var users: [User]
    @State private var path: [User] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationDestination(for: User.self) { user in
                EditeUserView(user: user)
            }
            .toolbar {
                Button("Add user", systemImage: "plus") {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ContentView()
}
