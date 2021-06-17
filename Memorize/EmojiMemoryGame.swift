//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sergiy Blednov on 6/7/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🚗", "🚕", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚛", "🛺", "🚁", "🚀", "🛥", "🚤", "⛵️", "⛴", "🚲", "🏍", "🚂", "🚚", "✈️", "🚜"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intend(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
