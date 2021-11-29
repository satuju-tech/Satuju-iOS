//
//  APIConstant.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation

struct APIConstant {

    static let TRANSLATION_BASE_API = "https://translation.googleapis.com/language/translate/v2"
    static let TRANSLATION_API_KEY = ProcessInfo.processInfo.environment["GOOGLE_TRANSLATION_API_KEY"] ?? ""

}
