//
//  TranslationHistoryRepository.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 02/11/21.
//

import Foundation
import RealmSwift

protocol TranslationHistoryRepositoryProtocol {
    func addTranslation(originLang: String, destinationLang: String, originText: String, destinationText: String)
    func getTranslationHistory() -> Results<TranslationHistory>
    func deleteTranslationHistory()
}

final class TranslationHistoryRepository: TranslationHistoryRepositoryProtocol {
    private let realm = try! Realm()
    private let translationHistory: Results<TranslationHistory>

    init(objects: TranslationHistory.Type = TranslationHistory.self) {
        translationHistory = realm.objects(objects)
    }

    func addTranslation(originLang: String, destinationLang: String, originText: String, destinationText: String) {
        do {
            try realm.write {
                let newTranslationHistory = TranslationHistory()
                newTranslationHistory.originLang = originLang
                newTranslationHistory.destinationLang = destinationLang
                newTranslationHistory.originText = originText
                newTranslationHistory.destinationText = destinationText
                realm.add(newTranslationHistory)
            }
        } catch {
            print(error)
        }
    }

    func getTranslationHistory() -> Results<TranslationHistory> {
        return translationHistory
    }

    func deleteTranslationHistory() {
        do {
            try realm.write {
                realm.delete(translationHistory)
            }
        } catch {
            print(error)
        }
    }
}
