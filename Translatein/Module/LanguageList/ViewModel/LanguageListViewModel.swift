//
//  LanguageListViewModel.swift
//  Satuju
//
//  Created by Arif Rahman on 03/11/21.
//

import Foundation

class LanguageListViewModel: ObservableObject {

    @Published var langs: [String: String] = [:]

    private var repository: TranslationRepositoryProtocol

    init(repository: TranslationRepositoryProtocol = TranslationRepository()) {
        self.repository = repository

        fetchLanguage()
    }
    func fetchLanguage() {
        repository.getLanguages(originLang: TranslateinApp().leftCountryCode ?? "") { supportedLanguages in
            self.langs = supportedLanguages.langs ?? [ "": "" ]
        } failCompletion: { error in
            print(error)
        }
    }
}
