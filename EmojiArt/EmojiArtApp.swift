//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Muhammad Anjum Kaiser on 02/11/2020.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
