//
//  LocationEnum.swift
//  Satuju
//
//  Created by Gede Wicaksana on 08/11/21.
//

import Foundation
import SwiftUI

enum LocationEnum: String {
    case zh = "China"
    case ka = "Canada"
    case ru = "Russia"
    case hi = "India"
    case ja = "Japan"
    case id = "Indonesia"
    func getCountryID() -> String {
        switch self {
        case .ka:
            return "ka"
        case .zh:
            return "zh"
        case .ru:
            return "ru"
        case .hi:
            return "hi"
        case .ja:
            return "ja"
        case .id:
            return "id"
        }
    }
    func getCountryName() -> String {
        switch self {
        case .ka:
            return "Canada"
        case .zh:
            return "Chinese"
        case .ru:
            return "Russian"
        case .hi:
            return "India"
        case .ja:
            return "Japanese"
        case .id:
            return "Indonesia"
        }
    }
}
