//
//  TranslationAPIService.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 31/10/21.
//

import Foundation
import Alamofire

protocol TranslationAPIServiceProtocol {

    func translate(text: String,
                   source: String,
                   target: String,
                   successCompletion: @escaping (Translation) -> Void,
                   failCompletion: @escaping (AFError) -> Void)

    func getLanguages(target: String,
                      successCompletion: @escaping (SupportedLanguages) -> Void,
                      failCompletion: @escaping (AFError) -> Void)

    func detectLanguage(text: String,
                        successCompletion: @escaping (DetectedLanguage) -> Void,
                        failCompletion: @escaping (AFError) -> Void)

}

final class TranslationAPIService: TranslationAPIServiceProtocol {

    func translate(text: String,
                   source: String,
                   target: String,
                   successCompletion: @escaping (Translation) -> Void,
                   failCompletion: @escaping (AFError) -> Void) {
        debugPrint(source, target, APIConstant.TRANSLATION_API_KEY)
        AF.request("\(APIConstant.TRANSLATION_BASE_API)",
                   method: .post,
                   parameters: ["q": text, "source": source, "target": target, "key": APIConstant.TRANSLATION_API_KEY])
            .responseDecodable(of: Translation.self) { response in
                switch response.result {
                case .success(let data):
                    successCompletion(data)
                case .failure(let error):
                    failCompletion(error)
                }
            }
    }

    func getLanguages(target: String, successCompletion: @escaping (SupportedLanguages) -> Void, failCompletion: @escaping (AFError) -> Void) {
        AF.request(
            "\(APIConstant.TRANSLATION_BASE_API)/languages?key=\(APIConstant.TRANSLATION_API_KEY)",
            method: .get,
            parameters: ["target": target])
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
        text: String,
        successCompletion: @escaping (DetectedLanguage) -> Void,
        failCompletion: @escaping (AFError) -> Void) {
            AF.request(
                "\(APIConstant.TRANSLATION_BASE_API)/detect?key=\(APIConstant.TRANSLATION_API_KEY)",
                method: .post,
                parameters: ["q": text])
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
