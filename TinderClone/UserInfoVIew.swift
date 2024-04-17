//
//  UserInfoVIew.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import SwiftUI

struct UserInfoVIew: View {
    @Binding var showProfileModal: Bool
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullname)
                    .font(.title)
                    .bold()
                Text("\(user.age)")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    showProfileModal.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .bold()
                        .imageScale(.large)
                }
            }
            Text("Actress | Witch")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoVIew(showProfileModal: .constant(false), user: MockData.users[1])
}
