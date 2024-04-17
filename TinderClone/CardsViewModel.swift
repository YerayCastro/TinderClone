//
//  CardsViewModel.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import Foundation

class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModels() }
    }
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("Failed to fetch card with error: \(error)")
        }
    }
    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
        cardModels.remove(at: index)
    }
}
