//
//  CardStackView.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import SwiftUI

struct CardStackView: View {
    @EnvironmentObject var matchManager: MatchManager
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    @State private var showMatchView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(viewModel.cardModels) { card in
                            CardView(viewModel: viewModel, model: card)
                        }
                    }
                    if !viewModel.cardModels.isEmpty {
                        SwipeActionButtonsView(viewModel: viewModel)
                    }
                }
                .blur(radius: showMatchView ? 20 : 0)
                
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .animation(.easeInOut, value: showMatchView)
            .onReceive(matchManager.$matchedUser, perform: { user in
                showMatchView = user != nil
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 88)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager())
}
