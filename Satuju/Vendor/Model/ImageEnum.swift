//
//  ImageEnum.swift
//  Satuju
//
//  Created by Gede Wicaksana on 09/11/21.
//

import Foundation
import SwiftUI

enum ImageEnum: String {
    case chinese = "zh"
    case english = "en"
    case spanish = "es"
    case hindi = "hi"
    case indonesia = "id"
    case japan = "ja"
    case canda = "kn"
    case korean = "ko"
    case portugize = "pt"
    case russia = "ru"
    func getCountryName() -> String {
        switch self {
        case .chinese:
            return "zh"
        case .english:
            return "en"
        case .spanish:
            return "es"
        case .hindi:
            return "hi"
        case .indonesia:
            return "id"
        case .japan:
            return "ja"
        case .canda:
            return "kn"
        case .korean:
            return "ko"
        case .portugize:
            return "pt"
        case .russia:
            return "ru"
        }
    }
}
