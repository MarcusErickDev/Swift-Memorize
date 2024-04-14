//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Marcus Erick Hinojosa Piña on 13/04/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        @StateObject var game = EmojiMemoryGame()
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
