//
//  LanguageList.swift
//  Satuju
//
//  Created by Arif Rahman on 01/11/21.
//

import SwiftUI

struct LanguageListView: View {

    @State private var searchQuery: String = ""

    @Binding var isOrigin: Bool
    @Binding var title: String
    @Binding var showModal: Bool

    @ObservedObject private var languageListViewModel = LanguageListViewModel()

    @AppStorage("leftLangCode") var leftLangCode: String?
    @AppStorage("leftLangName") var leftLangName: String?
    @AppStorage("leftLangImage") var leftImageName: String?
    @AppStorage("rightLangCode") var rightLangCode: String?
    @AppStorage("rightLangName") var rightLangName: String?
    @AppStorage("rightLangImage") var rightImageName: String?

    var langItem: [Language] {
        if searchQuery.isEmpty {
            return languageListViewModel.langs
        } else {
            return languageListViewModel.langs
                .filter {
                    if let language = $0.name {
                        return language.contains(searchQuery)
                    }
                    return false
                }
        }
    }

    var body: some View {
        ZStack {
            if langItem.isEmpty && searchQuery.isEmpty {
                ProgressView()
            }
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
                if !searchQuery.isEmpty && langItem.isEmpty {
                    HStack {
                        Text("Language unavailable")
                            .padding(16)
                        Spacer()
                    }
                }
                ScrollView {
                    ForEach(langItem, id: \.language) { item in
                        LanguangeItem(action: {
                            if isOrigin {
                                leftLangCode = item.language
                                leftLangName = item.name
                                leftImageName = ImageEnum(rawValue: item.language ?? "")?.getCountryImage() ?? item.language
                            } else {
                                rightLangCode = item.language
                                rightLangName = item.name
                                rightImageName = ImageEnum(rawValue: item.language ?? "")?.getCountryImage() ?? item.language
                            }
                            showModal.toggle()
                        },
                                      language: item.name ?? "",
                                      isSelected: isOrigin ? item.language?.elementsEqual(leftLangCode ?? "") ?? false : item.language?.elementsEqual(rightLangCode ?? "") ?? false)
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
            }
            .onAppear {
                languageListViewModel.fetchLanguage()
            }
        }
    }

}
