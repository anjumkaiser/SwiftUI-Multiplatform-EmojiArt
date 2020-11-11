//
//  EmojiArtExtensions.swift
//  EmojiArt
//
//  Created by Muhammad Anjum Kaiser on 11/11/2020.
//

import SwiftUI

extension Array where Element: Identifiable {
    func firstIndex(matching element: Element) -> Self.Index? {
        firstIndex(where: {$0.id == element.id})
    }
}

extension Array where Element == NSItemProvider {
    func loadObjects<T>(ofType theType: T.Type, firstOnly: Bool = false, using load: @escaping (T) -> Void) -> Bool where T: NSItemProviderReading {
            if let provider = self.first(where: { $0.canLoadObject(ofClass: theType) }) {
                provider.loadObject(ofClass: theType) { object, error in
                    if let value = object as? T {
                        DispatchQueue.main.async {
                            load(value)
                        }
                    }
                }
                return true
            }
            return false
        }
        func loadObjects<T>(ofType theType: T.Type, firstOnly: Bool = false, using load: @escaping (T) -> Void) -> Bool where T: _ObjectiveCBridgeable, T._ObjectiveCType: NSItemProviderReading {
            if let provider = self.first(where: { $0.canLoadObject(ofClass: theType) }) {
                let _ = provider.loadObject(ofClass: theType) { object, error in
                    if let value = object {
                        DispatchQueue.main.async {
                            load(value)
                        }
                    }
                }
                return true
            }
            return false
        }
        func loadFirstObject<T>(ofType theType: T.Type, using load: @escaping (T) -> Void) -> Bool where T: NSItemProviderReading {
            self.loadObjects(ofType: theType, firstOnly: true, using: load)
        }
        func loadFirstObject<T>(ofType theType: T.Type, using load: @escaping (T) -> Void) -> Bool where T: _ObjectiveCBridgeable, T._ObjectiveCType: NSItemProviderReading {
            self.loadObjects(ofType: theType, firstOnly: true, using: load)
        }
}
