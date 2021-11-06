//
//  TranslationBubbleViewModel.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//

import SwiftUI

class TranslationBubbleViewModel: NSObject, ObservableObject {
    @Published var isAutoPlayOn = true
    @Published var isDetectLanguageOn = true
    @Published var isSiriShortcutOn = true
    override init() {
        isAutoPlayOn = UserDefaults.standard.bool(forKey: "isAutoPlayOn")
        isDetectLanguageOn = UserDefaults.standard.bool(forKey: "isDetectLanguageOn")
        isSiriShortcutOn = UserDefaults.standard.bool(forKey: "isSiriShortcutOn")
    }
    func textToVoice(read: String, language: String) {
        //TextToVoiceService().speak(read: read, language: language)
    }
    func toggleAutoPlayButton() {
        isAutoPlayOn.toggle()
        UserDefaults.standard.set(self.isAutoPlayOn, forKey: "isAutoPlayOn")
    }
    func toggleAutoDetectLanguageButton() {
        isDetectLanguageOn.toggle()
        UserDefaults.standard.set(self.isDetectLanguageOn, forKey: "isDetectLanguageOn")
    }
    func toggleSiriShortcutButton() {
        isSiriShortcutOn.toggle()
        UserDefaults.standard.set(self.isSiriShortcutOn, forKey: "isSiriShortcutOn")
    }
    func toggleDeleteHistoryButton() {
        TranslationHistoryRepository().deleteTranslationHistory()
    }
}
