//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Muhammad Anjum Kaiser on 02/11/2020.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self) { emoji in
                    Text(emoji)
                        .font (Font.system(size: defaultEmojiSize))
                }
            }
        }
    }
    
    private let defaultEmojiSize: CGFloat = 40
}


struct EmojiArtDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
