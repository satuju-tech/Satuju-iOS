//
//  LocationEnum.swift
//  Satuju
//
//  Created by Gede Wicaksana on 08/11/21.
//

import Foundation
import SwiftUI

enum LocationEnum: String {
    case enEng = "England"
    case enSoa = "South Africa"
    case enBra = "Brazil"
    case enUS = "United States"
    case enAus = "Australia"
    case ru = "Russia"
    case hi = "India"
    case ja = "Japan"
    case id = "Indonesia"
    func getCountryID() -> String {
        switch self {
        case .enEng:
            return "en"
        case .enSoa:
            return "en"
        case .enBra:
            return "en"
        case .enUS:
            return "en"
        case .enAus:
            return "en"
        case .ru:
            return "ru"
        case .hi:
            return "hi"
        case .ja:
            return "ja"
        case .id:
            return "id"
        default:
            return "en"
        }
    }
    func getCountryName() -> String {
        switch self {
        case .enEng:
            return "Inggris"
        case .enSoa:
            return "Inggris"
        case .enBra:
            return "Inggris"
        case .enUS:
            return "Inggris"
        case .enAus:
            return "Inggris"
        case .ru:
            return "Rusia"
        case .hi:
            return "India"
        case .ja:
            return "Japan"
        case .id:
            return "Indonesia"
        default:
            return "Inggris"
        }
    }
}
