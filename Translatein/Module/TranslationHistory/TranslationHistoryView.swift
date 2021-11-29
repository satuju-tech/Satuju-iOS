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

    @State var tempDate = Date(timeIntervalSince1970: 1)

    @State var translationHistoryIdx = 0

    @Namespace var bottomID

    @State var date: [UUID: Date] = [:]

    let dateFormatter = DateFormatter()

    init() {
        dateFormatter.dateFormat = "EEEE, d MMM"
    }

    private func initTempDate() {
        var tempDate = Date(timeIntervalSince1970: 1)
        for item in translationHistory.results {
            if Calendar.current.compare(tempDate,
                                        to: item.date,
                                        toGranularity: .hour).rawValue != 0 {
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
                        alignment: .bottom
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
}

struct TranslationHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationHistoryView()
    }
}
