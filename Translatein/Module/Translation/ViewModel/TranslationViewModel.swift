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
    @Published var isTranslating = false

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
        let letters = NSCharacterSet.letters
        let range = originText.rangeOfCharacter(from: letters)

        if range != nil {
            let text = originText
            originText = "Translating..."
            isTranslating = true
            if isDetectLanguageOn && !isVoice {
                translationRepository.translateWithLanguageDetection(
                    firstLang: originLangCode,
                    secondLang: destLangCode,
                    text: text) { translatedText, isLeft in
                        self.configureTranslatedText(originText: text,
                                                     translatedText: translatedText,
                                                     originLangCode: originLangCode,
                                                     destLangCode: destLangCode,
                                                     isLeft: isLeft)
                    } failCompletion: { error in
                        print(error)
                        self.isTranslating = false
                        self.originText = "Please enable data connection and try again"
                    }
            } else {
                translationRepository.translate(text: text, source: originLangCode, target: destLangCode) { translatedText in

                    let isLeft = self.leftLangCode == originLangCode
                    self.configureTranslatedText(originText: text,
                                                 translatedText: translatedText,
                                                 originLangCode: originLangCode,
                                                 destLangCode: destLangCode,
                                                 isLeft: isLeft)
                } failCompletion: { error in
                    print(error)
                    self.isTranslating = false
                    self.originText = "Please enable data connection and try again"
                }
            }
        } else {
            self.originText = "Type or Tap Mic to Translate"
        }
    }

    private func configureTranslatedText(originText: String, translatedText: String, originLangCode: String, destLangCode: String, isLeft: Bool) {
        self.translatedText = translatedText

        // Add to Translation History (Realm)
        self.translationHistoryRepository.addTranslation(
            originLang: self.leftLangCode,
            destinationLang: self.rightLangCode,
            originText: originText,
            destinationText: self.translatedText,
            isLeft: isLeft)

        // Autoplay if isAutoPlayOn is true
        if self.isAutoPlayOn {
            TextToVoiceService().speak(read: self.translatedText, language: self.rightLangCode)
        }

        self.originText = "Type or Tap Mic to Translate"
        self.isTranslating = false
    }

}
