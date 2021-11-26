//
//  MenuListView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 29/10/21.
//

import SwiftUI
import RealmSwift

struct MenuListView: View {

    @StateObject var translationViewModel = TranslationViewModel()
    @AppStorage("isAutoPlayOn") var isAutoPlayOn: Bool = false
    @AppStorage("isDetectLanguageOn") var isDetectLanguageOn: Bool = false
    @AppStorage("isSiriShortcutOn") var isSiriShortcutOn: Bool = false

    @State var realm = try! Realm().objects(TranslationHistory.self)
    @State var toggleAutoPlayButton: (() -> Void)
    @State var toggleAutoDetectLanguageButton: (() -> Void)
    @State var toggleSiriShortcutButton: (() -> Void)
    @State var toggleClearHistoryButton: (() -> Void)
    @State var frameHeight = 170.0

    var body: some View {
        List {
            MenuListItem(
                action: {
                    toggleAutoPlayButton()
                    isAutoPlayOn.toggle()
                },
                checkMark: isAutoPlayOn,
                buttonText: "Auto Play Translation",
                systemName: "checkmark.circle.fill",
                textColor: .black
            )

            MenuListItem(
                action: {
                    toggleAutoDetectLanguageButton()
                    isDetectLanguageOn.toggle()
                },
                checkMark: isDetectLanguageOn,
                buttonText: "Detect Language",
                systemName: "checkmark.circle.fill",
                textColor: .black
            )

            MenuListItem(
                action: {
                    toggleSiriShortcutButton()
                    isSiriShortcutOn.toggle()
                },
                checkMark: false,
                buttonText: "Siri Shortcut",
                systemName: "checkmark.circle.fill",
                textColor: .black
            )

            if !realm.isEmpty {
                MenuListItem(
                    action: {
                        toggleClearHistoryButton()
                        TranslationHistoryRepository().deleteTranslationHistory()
                    },
                    checkMark: true,
                    buttonText: "Clear History",
                    systemName: "trash",
                    textColor: .red
                )
            }

        }
        .onAppear { UITableView.appearance().backgroundColor = UIColor.clear }
        .hasScrollEnabled(false)
        .cornerRadius(14)
        .frame(maxWidth: 266, maxHeight: (realm.isEmpty ? 170.0 : 212.0), alignment: .center)
        .listStyle(InsetGroupedListStyle())

    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(
            toggleAutoPlayButton: {},
            toggleAutoDetectLanguageButton: {},
            toggleSiriShortcutButton: {},
            toggleClearHistoryButton: {}
        ).opacity(0.95)
    }
}

struct MenuListItem: View {

    @State var action: (() -> Void)
    @State var checkMark: Bool
    @State var buttonText: String
    @State var systemName: String
    @State var textColor: Color

    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Image(systemName: systemName)
                    .foregroundColor(checkMark ? textColor : .clear)

                Text(buttonText)
                    .foregroundColor(textColor)
                    .font(.system(size: 17))
                    .frame(maxWidth: 300, alignment: .leading)
            }
        })
            .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
    }
}
