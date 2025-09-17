//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Dmitry Kononov on 17.09.25.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)

                Spacer()
                
                Text("\(user.unwrappedJobs.count)")
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear {
            addSample()
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    private func addSample() {
        let newUser = User(name: "New User \(UUID().uuidString)", city: "Test city", joinDate: .now)
        let job1 = Job(name: "Testerovschik", priority: 5)
        let job2 = Job(name: "Koder", priority: 3)
        
        modelContext.insert(newUser)
        newUser.jobs?.append(contentsOf: [job1, job2])
        
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
//        .modalContainer(for: User.self)
}
