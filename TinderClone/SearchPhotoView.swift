//
//  MessagePhotoView.swift
//  TinderClone
//
//  Created by Yery Castro on 26/3/24.
//

import SwiftUI

struct SearchPhotoView: View {
    @EnvironmentObject var matchManager: MatchManager
    let user: User
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading) {
                    Text("New Matches")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.pink)
                HStack {
                    ForEach(MockData.users) { user in
                        VStack{
                            Image(MockData.users[0].profileImageURLs[0])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay {
                                    Circle()
                                        .stroke(.white, lineWidth: 2)
                                        .shadow(radius: 4)
                                }
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            }
                        }
                    }
                
                }
                .padding()
            }
    }
}

#Preview {
    SearchPhotoView(user: MockData.users[0])
        .environmentObject(MatchManager())
}

//ScrollView(.horizontal) {
//    VStack(alignment: .leading) {
//            Text("New Matches")
//                .font(.subheadline)
//                .bold()
//                .foregroundStyle(.pink)
//        HStack {
//            ForEach(0 ..< 6) { photo in
//                Image(MockData.users[0].profileImageURLs[0])
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 100)
//                    .clipShape(Circle())
//                    .overlay {
//                        Circle()
//                            .stroke(.white, lineWidth: 2)
//                            .shadow(radius: 4)
//                    }
//                }
//            }
//        
//        }
//        .padding()
//    }
