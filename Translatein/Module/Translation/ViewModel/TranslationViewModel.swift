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

    private let translationRepository: TranslationRepositoryProtocol
    private let translationHistoryRepository: TranslationHistoryRepositoryProtocol

    init(translationRepository: TranslationRepositoryProtocol = TranslationRepository(),
         translationHistoryRepository: TranslationHistoryRepositoryProtocol = TranslationHistoryRepository()) {
        self.translationRepository = translationRepository
        self.translationHistoryRepository = translationHistoryRepository
    }

    func translate(originLangCode: String, destLangCode: String) {
        if !originText.isEmpty {
            let lang = "\(originLangCode)-\(destLangCode)"
            translationRepository.translate(text: originText, lang: lang) { response in
                self.translatedText = response.text?[0] ?? ""

                // Add to Translation History (Realm)
                self.translationHistoryRepository.addTranslation(
                    originLang: self.leftLangCode,
                    destinationLang: self.rightLangCode,
                    originText: self.originText,
                    destinationText: self.translatedText,
                    isLeft: true)

                // Autoplay if isAutoPlayOn is true
                if self.isAutoPlayOn {
                    TextToVoiceService().speak(read: self.translatedText, language: self.rightLangCode)
                }
                self.originText = "Enter Text"
            } failCompletion: { error in
                print(error)
            }
        }
    }

}
