//
//  TranslationAPIService.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation
import Alamofire

protocol TranslationAPIServiceProtocol {
    func translate(text: String, lang: String, successCompletion: @escaping (Translation) -> Void, failCompletion: @escaping (AFError) -> Void)

    func getLanguages(originLang: String, successCompletion: @escaping (SupportedLanguages) -> Void, failCompletion: @escaping (AFError) -> Void)

    func detectLanguage(
        languagePair: String,
        text: String,
        successCompletion: @escaping (DetectedLanguage) -> Void,
        failCompletion: @escaping (AFError) -> Void)
}

final class TranslationAPIService: TranslationAPIServiceProtocol {
    func translate(text: String, lang: String, successCompletion: @escaping (Translation) -> Void, failCompletion: @escaping (AFError) -> Void) {
        AF.request(
            "\(APIConstant.TRANSLATION_BASE_API)/translate?key=\(APIConstant.TRANSLATION_API_KEY)",
            method: .post,
            parameters: ["text": text, "lang": lang])
            .responseDecodable(of: Translation.self) { response in
                switch response.result {
                case .success(let data):
                    successCompletion(data)
                case .failure(let error):
                    failCompletion(error)
                }
            }
    }

    func getLanguages(originLang: String, successCompletion: @escaping (SupportedLanguages) -> Void, failCompletion: @escaping (AFError) -> Void) {
        AF.request(
            "\(APIConstant.TRANSLATION_BASE_API)/getLangs?key=\(APIConstant.TRANSLATION_API_KEY)&ui=\(originLang)",
            method: .post)
            .responseDecodable(of: SupportedLanguages.self) { response in
                switch response.result {
                case .success(let data):
                    successCompletion(data)
                case .failure(let error):
                    failCompletion(error)
                }
            }
    }

    func detectLanguage(
        languagePair: String,
        text: String,
        successCompletion: @escaping (DetectedLanguage) -> Void,
        failCompletion: @escaping (AFError) -> Void) {
        AF.request(
            "\(APIConstant.TRANSLATION_BASE_API)/detect?key=\(APIConstant.TRANSLATION_API_KEY)",
            method: .post,
            parameters: ["hint": languagePair, "text": text])
            .responseDecodable(of: DetectedLanguage.self) { response in
                switch response.result {
                case .success(let data):
                    successCompletion(data)
                case .failure(let error):
                    failCompletion(error)
                }
            }
    }
}
