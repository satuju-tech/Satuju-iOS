//
//  LanguageList.swift
//  Satuju
//
//  Created by Arif Rahman on 01/11/21.
//

import SwiftUI

struct LanguageList: View {
    @State private var isOrigin: Bool = false
    @State private var searchQuery: String = ""
    @State private var languages: [String: String] = [:]
    var body: some View {
        VStack {
            HStack {
                Text("Translate to")
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
            ForEach(languages.sorted(by: >), id: \.key) {key, valueText in
                LanguangeItem(language: valueText,
                              isSelected: isOrigin ? key.elementsEqual("OriginLangCode"): key.elementsEqual("DestinationLangCode")).padding(
                    .init(top: 10, leading: 20,
                          bottom: 10, trailing: 20)
                )
                Divider().padding(
                    .init(top: 0, leading: 20,
                          bottom: 0, trailing: 20)
                )
            }
            Spacer()
        }
    }
}

struct LanguageList_Previews: PreviewProvider {
    static var previews: some View {
        LanguageList()
    }
}
