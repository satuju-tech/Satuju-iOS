//
//  TranslationHistoryView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 02/11/21.
//

import SwiftUI
import RealmSwift

struct TranslationHistoryView: View {

    @ObservedObject private var translationHistory = TranslationHistoryViewModel(
        translationHistoryResults: try! Realm().objects(TranslationHistory.self)
    )

    @Namespace var bottomID

    var body: some View {
        if translationHistory.results.isEmpty {
            VStack {
                Spacer()

                Image("BrandIcon")
                    .resizable()
                    .scaledToFit()

                Text("Let's start a converstation")
                    .font(
                        .custom("NotoSans-Regular", size: 17)
                    )
                    .foregroundColor(Color("DividerColor"))
                    .multilineTextAlignment(.center)

                Spacer()
            }
            .frame(width: 129, alignment: .center)
        } else {
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(translationHistory.results, id: \.id) { item in
                            if item.id == translationHistory.results.last?.id {
                                TranslationBubble(
                                    isLeft: item.isLeft,
                                    textTranslationInput: item.originText,
                                    textTranslationResult: item.destinationText,
                                    destinationLangCode: item.destinationLang)
                                    .id(bottomID)
                                    .padding(.bottom, 40)
                            } else {
                                TranslationBubble(
                                    isLeft: item.isLeft,
                                    textTranslationInput: item.originText,
                                    textTranslationResult: item.destinationText,
                                    destinationLangCode: item.destinationLang)
                                    .padding(.bottom, 20)
                            }
                        }
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .top
                    )
                }
                .onAppear(perform: {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                })
                .onChange(of: translationHistory.results.count) { _ in
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
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
