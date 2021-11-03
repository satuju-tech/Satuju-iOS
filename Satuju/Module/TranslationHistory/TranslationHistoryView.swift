//
//  TranslationHistoryView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 02/11/21.
//

import SwiftUI
import RealmSwift

struct TranslationHistoryView: View {
    @ObservedObject var translationHistory = TranslationHistoryViewModel(translationHistoryResults: try! Realm().objects(TranslationHistory.self))

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(translationHistory.results, id: \.id) { item in
                    TranslationBubble(isOrigin: false, textTranslationInput: item.originText, textTranslationResult: item.destinationText)
                }
            }
        }
    }
}

struct TranslationHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationHistoryView()
    }
}
