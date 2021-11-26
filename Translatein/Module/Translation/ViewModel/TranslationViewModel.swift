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
                    text: text) { response, isLeft  in
                        self.configureTranslatedText(originText: text,
                                                     translatedText: response.text?[0] ?? "",
                                                     originLangCode: originLangCode,
                                                     destLangCode: destLangCode,
                                                     isLeft: isLeft)
                    } failCompletion: { error in
                        print(error)
                    }
            } else {
                let lang = "\(originLangCode)-\(destLangCode)"
                var isLeft = true
                if originLangCode != leftLangCode {
                    isLeft = false
                }
                translationRepository.translate(text: text, lang: lang) { response in
                    self.configureTranslatedText(originText: text,
                                                 translatedText: response.text?[0] ?? "",
                                                 originLangCode: originLangCode,
                                                 destLangCode: destLangCode,
                                                 isLeft: isLeft)
                } failCompletion: { error in
                    print(error)
                }
            }
        } else {
            self.originText = "Enter Text"
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

        self.originText = "Enter Text"
    }

}
