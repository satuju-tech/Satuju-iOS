//
//  LocationManagerRepository.swift
//  Satuju
//
//  Created by Gede Wicaksana on 01/11/21.
//

import SwiftUI

final class LocationManagerRepository: NSObject, ObservableObject {
    @Published var country = ""
    @Published var state = ""
    func setCountry(negara: String) {
        country = negara
        TranslationViewModel().changeLanguageButtonDestination()
    }
}
