//
//  CardView.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    @EnvironmentObject var matchManager: MatchManager
    
    @State private var xOffset: CGFloat = 0
    @State private var degress: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModal = false
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .overlay {
                        ImageScrollingOverlayView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorVIew(currentImageIndex: currentImageIndex,
                                       imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            UserInfoVIew(showProfileModal: $showProfileModal, user: user)
            
        }
        .fullScreenCover(isPresented: $showProfileModal) {
            UserProfileView(user: user)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degress))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

extension CardView {
    var user: User {
        return model.user
    }
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}

extension CardView {
    func returnToCenter() {
        xOffset = 0
        degress = 0
    }
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degress = 12
        } completion: {
            viewModel.removeCard(model)
            matchManager.checkForMatch(withUser: user)
        }
    }
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degress = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        let topCard = viewModel.cardModels.last
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degress = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}



#Preview {
    CardView(viewModel: CardsViewModel(service: CardService()), model: CardModel(user: MockData.users[1]))
}
