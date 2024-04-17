//
//  MessageView.swift
//  TinderClone
//
//  Created by Yery Castro on 26/3/24.
//

import SwiftUI

struct SearchView: View {
    let user: User
    @State var text = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    SearchPhotoView(user: user)
                    SearchCellView(user: user)
                    }
                    .padding(.horizontal)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Image(systemName: "flame")
                        }
                        ToolbarItem(placement: .topBarLeading) {
                            Image(systemName: "magnifyingglass")
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Image(systemName: "bubble")
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Image(systemName: "person")
                        }
                    }
                    .searchable(text: $text, placement: .toolbar, prompt: "Search a person")
                    .navigationTitle("Messages")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }


#Preview {
    NavigationStack{
        SearchView(user: MockData.users[0], text: "Message")
    }
}
