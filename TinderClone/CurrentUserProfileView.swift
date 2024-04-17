//
//  CurrentUserProfileView.swift
//  TinderClone
//
//  Created by Yery Castro on 26/3/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                Section {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.fullname)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text("janefox@gmail.com")
                    }
                } header: {
                    Text("Account Information")
                }
                Section {
                    Text("Terms of sevice")
                } header: {
                    Text("Legal")
                }
                Section {
                    Button {
                        print("Logout here..")
                    } label: {
                        Text("Logout")
                    }
                    
                }
                .foregroundStyle(.red)
                
                Section {
                    Button {
                        print("Delete Account here")
                    } label: {
                        Text("Delete Account")
                    }
                }
                .foregroundStyle(.red)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    NavigationStack {
        CurrentUserProfileView(user: MockData.users[0])
    }
}
