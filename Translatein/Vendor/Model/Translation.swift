//
//  Translation.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation

// MARK: - Translation
struct Translation: Codable {
    let data: TranslationData?
}

// MARK: - DataClass
struct TranslationData: Codable {
    let translations: [TranslationElement]?
}

// MARK: - TranslationElement
struct TranslationElement: Codable {
    let translatedText: String?
}
