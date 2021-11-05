//
//  VoiceRecognitionViewModel.swift
//  Satuju
//
//  Created by Gede Wicaksana on 05/11/21.
//

import SwiftUI

class VoiceRecognitionViewModel: ObservableObject {
    @Published var isAutoDetectLanguageHidden: Bool = false
    func autoDetectLanguageButtonClicked() {
        isAutoDetectLanguageHidden.toggle()
        print("Sambung ke fitur soundwave and start listening")
    }
}
