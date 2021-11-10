//
//  ImageEnum.swift
//  Satuju
//
//  Created by Gede Wicaksana on 09/11/21.
//
import Foundation
import SwiftUI

enum ImageEnum: String {
    case russian = "sah"
    case india1 = "gu"
    case india2 = "ml"
    case india3 = "mr"
    case india4 = "te"
    case indonesia1 = "jv"
    case indonesia2 = "su"
    case southAfrica = "zu"
    case israel = "yi"
    case pakistan = "ur"
    case belanda = "lb"
    case denmark = "da"
    case cuba = "pap"
    
    func getCountryImage() -> String {
        switch self {
        case .russian:
            return "ru"
        case .india1, .india2, .india3, .india4:
            return "hi"
        case .indonesia1, .indonesia2:
            return "id"
        case .southAfrica:
            return "af"
        case .israel:
            return "he"
        case .pakistan:
            return "pa"
        case .belanda:
            return "nl"
        case .denmark:
            return "dk"
        case .cuba:
            return "ceb"
        }
    }
}
