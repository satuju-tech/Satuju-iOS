//
//  SupportedLanguages.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation

// MARK: - Languages
struct SupportedLanguages: Codable {
    let data: SupportedLanguagesData?
}

// MARK: - DataClass
struct SupportedLanguagesData: Codable {
    let languages: [Language]?
}

// MARK: - Language
struct Language: Codable {
    let language, name: String?
}
