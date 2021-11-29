//
//  TranslationViewModel.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 08/11/21.
//

import Foundation
import SwiftUI

class TranslationViewModel: ObservableObject {

    @Published var originText = ""
    @Published var translatedText = ""

    @AppStorage("leftLangCode") var leftLangCode: String = "id"
    @AppStorage("rightLangCode") var rightLangCode: String = "en"
    @AppStorage("isAutoPlayOn") var isAutoPlayOn: Bool = false
    @AppStorage("isDetectLanguageOn") var isDetectLanguageOn: Bool = false

    private let translationRepository: TranslationRepositoryProtocol
    private let translationHistoryRepository: TranslationHistoryRepositoryProtocol

    init(translationRepository: TranslationRepositoryProtocol = TranslationRepository(),
         translationHistoryRepository: TranslationHistoryRepositoryProtocol = TranslationHistoryRepository()) {
        self.translationRepository = translationRepository
        self.translationHistoryRepository = translationHistoryRepository
    }

    func translate(originLangCode: String, destLangCode: String, isVoice: Bool) {
        if !originText.isEmpty {
            let text = originText
            originText = "Translating..."
            if isDetectLanguageOn && !isVoice {
                translationRepository.translateWithLanguageDetection(
                    firstLang: originLangCode,
                    secondLang: destLangCode,
                    text: text) { translatedText in
                        self.configureTranslatedText(originText: text,
                                                     translatedText: translatedText,
                                                     originLangCode: originLangCode,
                                                     destLangCode: destLangCode)
                    } failCompletion: { error in
                        print(error)
                    }
            } else {
                translationRepository.translate(text: text, source: originLangCode, target: destLangCode) { translatedText in
                    self.configureTranslatedText(originText: text,
                                                 translatedText: translatedText,
                                                 originLangCode: originLangCode,
                                                 destLangCode: destLangCode)
                } failCompletion: { error in
                    print(error)
                }
            }
        } else {
            self.originText = "Enter Text"
        }
    }

    private func configureTranslatedText(originText: String, translatedText: String, originLangCode: String, destLangCode: String) {
        self.translatedText = translatedText

        // Add to Translation History (Realm)
        self.translationHistoryRepository.addTranslation(
            originLang: self.leftLangCode,
            destinationLang: self.rightLangCode,
            originText: originText,
            destinationText: self.translatedText,
            isLeft: true)

        // Autoplay if isAutoPlayOn is true
        if self.isAutoPlayOn {
            TextToVoiceService().speak(read: self.translatedText, language: self.rightLangCode)
        }

        self.originText = "Enter Text"
    }

}
