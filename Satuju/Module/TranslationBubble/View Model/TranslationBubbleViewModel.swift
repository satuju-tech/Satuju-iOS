//
//  TranslationBubbleViewModel.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//

import SwiftUI

class TranslationBubbleViewModel: NSObject, ObservableObject {
    @AppStorage("isAutoPlayOn") var isAutoPlayOn: Bool = false
    @AppStorage("isDetectLanguageOn") var isDetectLanguageOn: Bool = false
    @AppStorage("isSiriShortcutOn") var isSiriShortcutOn: Bool = false
    func reloadView() {
        objectWillChange.send()
    }
    func textToVoice(read: String, language: String) {
        TextToVoiceService().speak(read: read, language: language)
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
