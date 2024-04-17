//
//  CardImageIndicatorVIew.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import SwiftUI

struct CardImageIndicatorVIew: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
               Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .gray)
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension CardImageIndicatorVIew {
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview {
    CardImageIndicatorVIew(currentImageIndex: 1, imageCount: 3)
}
