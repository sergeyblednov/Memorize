//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sergiy Blednov on 5/20/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
