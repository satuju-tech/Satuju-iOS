//
//  LanguageList.swift
//  Satuju
//
//  Created by Arif Rahman on 01/11/21.
//

import SwiftUI

struct LanguageListView: View {
    @State var isOrigin: Bool
    @State private var searchQuery: String = ""
    @Binding var title: String
    @Binding var showModal: Bool
    @ObservedObject var languageListViewModel = LanguageListViewModel()
    @AppStorage("leftLangCode") var leftLangCode: String?
    @AppStorage("leftLangName") var leftLangName: String?
    @AppStorage("leftLangImage") var leftImageName: String?
    @AppStorage("rightLangCode") var rightLangCode: String?
    @AppStorage("rightLangName") var rightLangName: String?
    @AppStorage("rightLangImage") var rightImageName: String?
    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
            }
            .padding(
                .init(top: 36, leading: 24,
                      bottom: 20, trailing: 24)
            )
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("ItemSearchColor"))
                TextField(
                    "Search",
                    text: $searchQuery
                ).foregroundColor(Color("ItemSearchColor"))
                Button {
                } label: {
                    Image(systemName: "mic.fill")
                        .foregroundColor(Color("ItemSearchColor"))
                }
            }
            .padding(
                .init(top: 8, leading: 8,
                      bottom: 8, trailing: 8)
            )
            .background(Color("SearchColor"))
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5).foregroundColor(Color.gray))
            .padding(
                .init(top: 0, leading: 24,
                      bottom: 20, trailing: 24)
            )
            ScrollView {
                ForEach( langItem.sorted {
                    $0.1 < $1.1
                }, id: \.key ) { key, valueText in
                    LanguangeItem(action: {
                        if isOrigin {
                            leftLangCode = key
                            leftLangName = valueText
                            leftImageName = ImageEnum(rawValue: key)?.rawValue ?? "all"
                        } else {
                            rightLangCode = key
                            rightLangName = valueText
                            rightImageName = ImageEnum(rawValue: key)?.rawValue ?? "all"
                        }
                        showModal.toggle()
                    }, language: valueText, isSelected: isOrigin ? key.elementsEqual(SatujuApp().leftLangCode ?? ""):
                                    key.elementsEqual(SatujuApp().rightLangCode ?? ""))
                        .padding(.init(top: 10, leading: 20,
                                       bottom: 10, trailing: 20)
                        )
                    Divider().padding(
                        .init(top: 0, leading: 20,
                              bottom: 0, trailing: 20)
                    )
                }
            }
            Spacer()
        }.onAppear {
            languageListViewModel.fetchLanguage()
        }
    }
    var langItem: [String: String] {
        if searchQuery.isEmpty {
            return languageListViewModel.langs
        } else {
            return languageListViewModel.langs
                .filter { $0.value.contains(searchQuery) }
        }
    }
}
