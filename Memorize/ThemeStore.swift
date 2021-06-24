//
//  ThemeStore.swift
//  Memorize
//
//  Created by Sergey Blednov on 6/24/21.
//

import SwiftUI

class ThemeStore: ObservableObject {
    var name: String
    
    @Published var themes = [Theme]()
    
    
    
    init(named name: String) {
        self.name = name
        if themes.isEmpty {
            print("using build-in themes")
            insertTheme(named: "Vehicles", color: RGBAColor(color: Color(red: 1, green: 0, blue: 0)), emojis: "🚙🚗🚘🚕🚖🏎🚚🛻🚛🚐🚓🚔🚑🚒")
            insertTheme(named: "Sports", color: RGBAColor(color: Color(red: 1, green: 0, blue: 1)), emojis: "🏈⚾️🏀⚽️🎾🏐🥏🏓⛳️🥅🥌🏂⛷🎳")
            insertTheme(named: "Music", color: RGBAColor(color: Color(red: 0, green: 0, blue: 1)), emojis: "🎼🎤🎹🪘🥁🎺🪗🪕🎻")
            insertTheme(named: "Animals", color: RGBAColor(color: Color(red: 0.4, green: 1, blue: 0.2)), emojis: "🐆🦓🦍🦧🦣🐘🦛🦏🐪🐫🦒🦘🦬🐃🦙🐐🦌🐕🐩")
            insertTheme(named: "Flora", color: RGBAColor(color: Color(red: 1, green: 0.75, blue: 0)), emojis: "🌲🌴🌿☘️🍀🍁🍄🌾💐🌷🌹🥀🌺🌸🌼🌻")
            insertTheme(named: "Weather", color: RGBAColor(color: Color(red: 1, green: 0, blue: 0.5)), emojis: "☀️🌤⛅️🌥☁️🌦🌧")
            insertTheme(named: "COVID", color: RGBAColor(color: Color(red: 1, green: 0.5, blue: 0.5)), emojis: "💉🦠😷🤧🤒")
        } else {
            print("succeswfully loaded themes from UserDefaults: \(themes)")
        }
    }
    
    // MARK: - intent(s)
     
    func theme(at index: Int) -> Theme {
        let safeIndex = min(max(index, 0), themes.count - 1)
        return themes[safeIndex]
    }
    
    @discardableResult
    func removeTheme(at index: Int) -> Int {
        if themes.count > 1, themes.indices.contains(index) {
            themes.remove(at: index)
        }
        return index % themes.count
    }
    
    func insertTheme(named name: String, color: RGBAColor, emojis: String? = nil, at index: Int = 0) {
        let unique = (themes.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let theme = Theme(name: name, color: color, emojis: emojis ?? "", id: unique)
        let safeIndex = min(max(index, 0), themes.count)
        themes.insert(theme, at: safeIndex)
    }
}

extension Color {
    init(rgbaColor rgba: RGBAColor) {
        self.init(.sRGB, red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
    }
}

extension RGBAColor {
    init(color: Color) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        if let cgColor = color.cgColor {
            UIColor(cgColor: cgColor).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        }
        self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
    }
}
