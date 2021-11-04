//
//  LanguageListViewModel.swift
//  Satuju
//
//  Created by Arif Rahman on 03/11/21.
//

import Foundation

class LanguageListViewModel: ObservableObject {
    private var repository: TranslationRepository!
    @Published var langs: [String: String] = [:]
    init() {
        repository = TranslationRepository()
        fetchLanguage()
    }
    func fetchLanguage() {
        repository.getLanguages(originLang: SatujuApp().originLangCode ?? "") { supportedLanguages in
            self.langs = supportedLanguages.langs ?? [ "": "" ]
        } failCompletion: { error in
            print(error)
        }
    }
}
