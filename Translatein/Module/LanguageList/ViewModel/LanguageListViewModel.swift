//
//  LanguageListViewModel.swift
//  Satuju
//
//  Created by Arif Rahman on 03/11/21.
//

import Foundation

class LanguageListViewModel: ObservableObject {

    @Published var langs: [Language] = []

    private var repository: TranslationRepositoryProtocol

    init(repository: TranslationRepositoryProtocol = TranslationRepository()) {
        self.repository = repository

        fetchLanguage()
    }
    func fetchLanguage() {
        repository.getLanguages(target: "en") { supportedLanguages in
            self.langs = supportedLanguages.data?.languages ?? []
        } failCompletion: { error in
            print(error)
        }
    }
}
