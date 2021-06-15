//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sergiy Blednov on 6/7/21.
//

import SwiftUI

class EmojiMemoryGame {
 
    
    private var model: MemoryGame<String> = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
        "😀"
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
