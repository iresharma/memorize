//
//  memorizeApp.swift
//  memorize
//
//  Created by iresh sharma on 22/04/21.
//

import SwiftUI

@main
struct memorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            MemoryGameView(viewModel: game)
        }
    }
}
