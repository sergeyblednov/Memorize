//
//  Theme.swift
//  Memorize
//
//  Created by Sergey Blednov on 6/24/21.
//

import Foundation

struct Theme: Identifiable, Codable, Hashable {
    var name: String
    var color: RGBAColor
    var emojis: String
    var id: Int
}

struct RGBAColor: Codable, Hashable, Equatable {
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
}
