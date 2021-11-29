//
//  TranslationHistoryView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 02/11/21.
//

import SwiftUI
import RealmSwift

struct TranslationHistoryView: View {

    @StateObject private var translationHistory = TranslationHistoryViewModel(
        translationHistoryResults: try! Realm().objects(TranslationHistory.self)
    )

    @State private var tempDate = Date()
    @State private var date: [UUID: Date] = [:]
    @State private var translationHistoryIdx = 0

    @Namespace private var bottomID

    private let dateFormatter: () = DateFormatter().dateFormat = "EEEE, d MMM"

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
                            if let safeDate = date[item.id] {
                                HStack {
                                    Text("\(safeDate.getFormattedDate(format: "EEEE, d MMM"))")
                                        .font(.custom("NotoSans-Regular", size: 11))

                                    Spacer()
                                }
                                .padding(.horizontal, 20)
                            }

                            if item.id == translationHistory.results.last?.id {
                                TranslationBubble(
                                    isLeft: item.isLeft,
                                    action: {},
                                    textTranslationInput: item.originText,
                                    textTranslationResult: item.destinationText,
                                    destinationLangCode: item.destinationLang)
                                    .id(bottomID)
                                    .padding(.bottom, 40)
                                    .onAppear {
                                        translationHistoryIdx += 1
                                    }
                            } else {
                                TranslationBubble(
                                    isLeft: item.isLeft,
                                    action: {},
                                    textTranslationInput: item.originText,
                                    textTranslationResult: item.destinationText,
                                    destinationLangCode: item.destinationLang)
                                    .padding(.bottom, 20)
                                    .onAppear {
                                        translationHistoryIdx += 1
                                    }
                            }
                        }
                    }
                    .frame(
                        maxHeight: .infinity,
                        alignment: .top
                    )
                }
                .onAppear(perform: {
                    initTempDate()

                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                })
                .onChange(of: translationHistory.results.count) { _ in
                    updateTempDate(id: translationHistory.results.last?.id ?? UUID(), newDate: translationHistory.results.last?.date ?? Date())
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                }
            }
        }
    }

    private func initTempDate() {
        for item in translationHistory.results {
            if Calendar.current.compare(tempDate,
                                        to: item.date,
                                        toGranularity: .hour).rawValue != 0
                || item == translationHistory.results.first {
                date[item.id] = item.date
                tempDate = item.date
            }
        }
    }

    private func updateTempDate(id: UUID, newDate: Date) {
        if Calendar.current.compare(tempDate, to: newDate, toGranularity: .hour).rawValue != 0 {
            date[id] = newDate
            tempDate = newDate
        }
    }

}

struct TranslationHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationHistoryView()
    }
}
