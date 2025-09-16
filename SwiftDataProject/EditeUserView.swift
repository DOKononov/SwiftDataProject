//
//  EditeUserView.swift
//  SwiftDataProject
//
//  Created by Dmitry Kononov on 16.09.25.
//

import SwiftUI

struct EditeUserView: View {
    @Bindable var user: User
    
    
    var body: some View {
        Form {
            TextField("User name", text: $user.name)
            TextField("User city", text: $user.city)
            DatePicker("Join date", selection: $user.joinDate, displayedComponents: .date)
        }
        .navigationTitle("Edite user")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditeUserView(user: User(name: "Test", city: "Test", joinDate: .now))
}
