//
//  MessageCellView.swift
//  TinderClone
//
//  Created by Yery Castro on 26/3/24.
//

import SwiftUI

struct SearchCellView: View {
    let user: User
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("Messages")
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(.pink)
                ForEach(MockData.users) { user in
                    HStack{
                        Image(MockData.users[1].profileImageURLs[1])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .shadow(radius: 4)
                            }
                        VStack(alignment: .leading){
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            Text("Messages here...")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    SearchCellView(user: MockData.users[0])
}
