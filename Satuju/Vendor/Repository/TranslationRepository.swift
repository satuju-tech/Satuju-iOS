//
//  TranslationRepository.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation

protocol TranslationRepositoryProtocol {
    func translate(text: String, lang: String, successCompletion: @escaping (Translation) -> Void, failCompletion: @escaping (String) -> Void)

    func getLanguages(originLang: String, successCompletion: @escaping (SupportedLanguages) -> Void, failCompletion: @escaping (String) -> Void)

    func translateWithLanguageDetection(
        firstLang: String,
        secondLang: String,
        text: String,
        successCompletion: @escaping (Translation) -> Void,
        failCompletion: @escaping (String) -> Void)
}

final class TranslationRepository: TranslationRepositoryProtocol {
    private let apiService: TranslationAPIServiceProtocol

    init(apiService: TranslationAPIServiceProtocol = TranslationAPIService()) {
        self.apiService = apiService
    }

    func translate(text: String, lang: String, successCompletion: @escaping (Translation) -> Void, failCompletion: @escaping (String) -> Void) {
        apiService.translate(text: text, lang: lang) { response in
            successCompletion(response)
        } failCompletion: { error in
            failCompletion(error.errorDescription ?? "error")
        }
    }

    func getLanguages(originLang: String, successCompletion: @escaping (SupportedLanguages) -> Void, failCompletion: @escaping (String) -> Void) {
        apiService.getLanguages(originLang: originLang) { supportedLanguages in
            successCompletion(supportedLanguages)
        } failCompletion: { error in
            failCompletion(error.errorDescription ?? "error")
        }
    }

    func translateWithLanguageDetection(
        firstLang: String = "",
        secondLang: String = "",
        text: String,
        successCompletion: @escaping (Translation) -> Void,
        failCompletion: @escaping (String) -> Void) {
        let pairOfLanguage = "\(firstLang),\(secondLang)"

        apiService.detectLanguage(languagePair: pairOfLanguage, text: text) { detectedLanguage in
            var lang = ""

            if detectedLanguage.lang == firstLang {
                lang = "\(firstLang)-\(secondLang)"
            } else {
                lang = "\(secondLang)-\(firstLang)"
            }

            self.apiService.translate(text: text, lang: lang) { translation in
                successCompletion(translation)
            } failCompletion: { error in
                failCompletion(error.errorDescription ?? "error")
            }
        } failCompletion: { error in
            failCompletion(error.errorDescription ?? "error")
        }
    }
}
