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
}
