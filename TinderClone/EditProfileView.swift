//
//  EditProfileView.swift
//  TinderClone
//
//  Created by Yery Castro on 26/3/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var bio = ""
    @State private var ocupation = "Actress"
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImageGridView(user: user)
                    .padding()
                VStack(spacing: 24) {
                    VStack(alignment: .leading) {
                        Text("About Me")
                            .font(.subheadline)
                            .bold()
                            .padding(.leading)
                        TextField("Add your bio", text: $bio, axis: .vertical)
                            .padding()
                            .frame(minHeight: 63, alignment: .top)
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                    }
                    VStack(alignment: .leading) {
                        Text("Occupation")
                            .font(.subheadline)
                            .bold()
                            .padding(.leading)
                        HStack {
                            Image(systemName: "book")
                            Text("Occupation")
                            Spacer()
                            Text(ocupation)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                    VStack(alignment: .leading) {
                        Text("Gender")
                            .font(.subheadline)
                            .bold()
                            .padding(.leading)
                        HStack {
                            Text("Man")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                    VStack(alignment: .leading) {
                        Text("Seaxual orientation")
                            .font(.subheadline)
                            .bold()
                            .padding(.leading)
                        HStack {
                            Text("Straigth")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileView(user: MockData.users[0])
    }
}
