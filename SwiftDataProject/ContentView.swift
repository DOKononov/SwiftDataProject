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
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
 
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .toolbar {
                Button("Add samples", systemImage: "plus") {

                    let new = User(
                        name: ["Alice", "Bob", "Charlie", "Diana"].randomElement() ?? "User",
                        city: ["Berlin", "Paris", "London", "New York"].randomElement() ?? "City",
                        joinDate: Date()
                    )
                    modelContext.insert(new)
                    try? modelContext.save()
                }
                Button("wipe", systemImage: "trash") {
                    try? modelContext.delete(model: User.self)
                    try? modelContext.save()
                }
                Button("wisability", systemImage: showingUpcomingOnly ? "eye.slash" : "eye") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        Text("Sort by date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ContentView()
}
