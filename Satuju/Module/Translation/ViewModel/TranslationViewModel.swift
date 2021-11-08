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

    @AppStorage("originLangCode") var originLangCode: String = "test"
    @AppStorage("destLangCode") var destLangCode: String = "test"

    private let translationRepository: TranslationRepositoryProtocol
    private let translationHistoryRepository: TranslationHistoryRepositoryProtocol

    init(
        translationRepository: TranslationRepositoryProtocol = TranslationRepository(),
        translationHistoryRepository: TranslationHistoryRepositoryProtocol = TranslationHistoryRepository()) {
            self.translationRepository = translationRepository
            self.translationHistoryRepository = translationHistoryRepository
        }

    func translate() {
        if !originText.isEmpty {
            let lang = "\(originLangCode)-\(destLangCode)"
            print(originText, lang)
            translationRepository.translate(text: originText, lang: lang) { response in
                self.translatedText = response.text?[0] ?? ""
                self.translationHistoryRepository.addTranslation(
                    originLang: self.originLangCode,
                    destinationLang: self.destLangCode,
                    originText: self.originText,
                    destinationText: self.translatedText,
                    isLeft: true)
            } failCompletion: { error in
                print(error)
            }
        }
    }
}
