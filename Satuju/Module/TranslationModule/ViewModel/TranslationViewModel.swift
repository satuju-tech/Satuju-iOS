//
//  TranslationViewModel.swift
//  Satuju
//
//  Created by Gede Wicaksana on 02/11/21.
//

import Foundation
import SwiftUI

final class TranslationViewModel: ObservableObject {
    @ObservedObject var viewModel = LocationManagerRepository()
    @Published var imageNameButtonOrigin = "INA"
    @Published var countryNameButtonOrigin = "Indonesia"
    @Published var imageNameButtonDestination = "UK"
    @Published var countryNameButtonDestination = "England"

    func changeLanguageButtonOrigin() {
        imageNameButtonOrigin = "UK"
        countryNameButtonOrigin = "England"
    }
    func changeLanguageButtonDestination() {
        imageNameButtonDestination = "INA"
        countryNameButtonDestination = "Indonesia"
    }
}
