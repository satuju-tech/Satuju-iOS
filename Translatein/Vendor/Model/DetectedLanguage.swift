//
//  DetectedLanguage.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation

struct DetectedLanguage: Codable {
    let data: DetectedLanguageData?
}

struct DetectedLanguageData: Codable {
    let detections: [[Detection]]?
}

// MARK: - Detection
struct Detection: Codable {
    let language: String?
}
