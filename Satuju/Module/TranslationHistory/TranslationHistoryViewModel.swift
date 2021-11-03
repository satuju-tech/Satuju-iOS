//
//  TranslationHistoryViewModel.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 02/11/21.
//

import Foundation
import RealmSwift

class TranslationHistoryViewModel<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {
    var results: Results<Element>
    private var token: NotificationToken!

    init(translationHistoryResults: Results<Element>) {
        self.results = translationHistoryResults
        lateInit()
    }

    func lateInit() {
        token = results.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    deinit {
        token.invalidate()
    }
}
