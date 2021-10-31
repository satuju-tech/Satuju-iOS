//
//  TranslationRepository.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation

protocol TranslationRepositoryProtocol {
    func translate(text: String, lang: String, successCompletion: @escaping (Translation) -> Void, failCompletion: @escaping (String) -> Void)
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
}
