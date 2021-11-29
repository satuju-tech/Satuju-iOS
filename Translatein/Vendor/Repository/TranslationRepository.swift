//
//  TranslationRepository.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation

protocol TranslationRepositoryProtocol {

    func translate(text: String,
                   source: String,
                   target: String,
                   successCompletion: @escaping (String) -> Void,
                   failCompletion: @escaping (String) -> Void)

    func getLanguages(target: String,
                      successCompletion: @escaping (SupportedLanguages) -> Void,
                      failCompletion: @escaping (String) -> Void)

    func translateWithLanguageDetection(firstLang: String,
                                        secondLang: String,
                                        text: String,
                                        successCompletion: @escaping (String) -> Void,
                                        failCompletion: @escaping (String) -> Void)

}

final class TranslationRepository: TranslationRepositoryProtocol {

    private let apiService: TranslationAPIServiceProtocol

    init(apiService: TranslationAPIServiceProtocol = TranslationAPIService()) {
        self.apiService = apiService
    }

    func translate(text: String,
                   source: String,
                   target: String,
                   successCompletion: @escaping (String) -> Void,
                   failCompletion: @escaping (String) -> Void) {
        apiService.translate(text: text, source: source, target: target) { response in
            successCompletion(response.data?.translations?[0].translatedText ?? "")
        } failCompletion: { error in
            failCompletion(error.errorDescription ?? "error")
        }
    }

    func getLanguages(target: String, successCompletion: @escaping (SupportedLanguages) -> Void, failCompletion: @escaping (String) -> Void) {
        apiService.getLanguages(target: target) { supportedLanguages in
            successCompletion(supportedLanguages)
        } failCompletion: { error in
            failCompletion(error.errorDescription ?? "error")
        }
    }

    func translateWithLanguageDetection(
        firstLang: String = "",
        secondLang: String = "",
        text: String,
        successCompletion: @escaping (String) -> Void,
        failCompletion: @escaping (String) -> Void) {
            apiService.detectLanguage(text: text) { detectedLanguage in
                var source = firstLang
                var target = secondLang
                let detectedLanguage = detectedLanguage.data?.detections?[0][0].language

                if detectedLanguage == secondLang {
                    source = secondLang
                    target = firstLang
                }

                self.apiService.translate(text: text, source: source, target: target) { translation in
                    successCompletion(translation.data?.translations?[0].translatedText ?? "")
                } failCompletion: { error in
                    failCompletion(error.errorDescription ?? "error")
                }
            } failCompletion: { error in
                failCompletion(error.errorDescription ?? "error")
            }
        }

}
