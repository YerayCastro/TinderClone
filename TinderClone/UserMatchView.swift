//
//  UserMatchView.swift
//  TinderClone
//
//  Created by Yery Castro on 26/3/24.
//

import SwiftUI

struct UserMatchView: View {
    @EnvironmentObject var matchManager: MatchManager
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
            VStack(spacing: 120) {
                VStack {
                    Image(.images)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    if let matchedUser = matchManager.matchedUser {
                        Text("You and \(matchedUser.fullname) have liked each other.")
                            .foregroundStyle(.white)
                    }
                }
                
                HStack(spacing: 16) {
                    Image(MockData.users[0].profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }
                    if let matchedUser = matchManager.matchedUser {
                        Image(matchedUser.profileImageURLs[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .shadow(radius: 4)
                            }
                    }
                }
                
                VStack(spacing: 16) {
                    Button {
                        show.toggle()
                    } label: {
                        Text("Send a message")
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(Capsule())
                    Button {
                        show.toggle()
                    } label: {
                        Text("Keep swiping")
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.clear)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 2)
                            .shadow(radius: 4)
                    }

                }
            }
        }
    }
}

#Preview {
    UserMatchView(show: .constant(true))
        .environmentObject(MatchManager())
}
