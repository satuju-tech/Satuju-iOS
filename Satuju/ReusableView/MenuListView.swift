//
//  MenuListView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 29/10/21.
//

import SwiftUI

struct MenuListView: View {
    @State var isAutoPlayOn: Bool = UserDefaults.standard.bool(forKey: "isAutoPlayOn")
    @State var isDetectLanguageOn: Bool = UserDefaults.standard.bool(forKey: "isDetectLanguageOn")
    @State var isSiriShortcutOn: Bool = UserDefaults.standard.bool(forKey: "isSiriShortcutOn")
    init() {
        UITableView.appearance().backgroundColor = .none
    }
    var body: some View {
        List {
            Button(action: {autoPlay()}, label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(isAutoPlayOn ? .black : .clear)
                    Text("Auto Play Translation")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .frame(maxWidth: 300, alignment: .leading)
                }.contentShape(Rectangle())
            })
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            Button(action: {detectLanguage()}, label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(isDetectLanguageOn ? .black : .clear)
                    Text("Detect Language")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .frame(maxWidth: 300, alignment: .leading)
                }.contentShape(Rectangle())
            })
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            Button(action: {siriShortcut()}, label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(isSiriShortcutOn ? .black : .clear)
                    Text("Siri Shortcut")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .frame(maxWidth: 300, alignment: .leading)
                }.contentShape(Rectangle())
            })
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                    Text("Clear History")
                        .foregroundColor(.red)
                        .font(.system(size: 17))
                        .frame(maxWidth: 300, alignment: .leading)
                }.contentShape(Rectangle())
            })
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
        }
        .hasScrollEnabled(false)
        .cornerRadius(14)
        .padding()
        .foregroundColor(.white)
        .frame(width: 300, height: 250, alignment: .center)
    }
    func autoPlay() {
        isAutoPlayOn.toggle()
        UserDefaults.standard.set(self.isAutoPlayOn, forKey: "isAutoPlayOn")
    }
    func detectLanguage() {
        isDetectLanguageOn.toggle()
        UserDefaults.standard.set(self.isDetectLanguageOn, forKey: "isDetectLanguageOn")
    }
    func siriShortcut() {
        isSiriShortcutOn.toggle()
        UserDefaults.standard.set(self.isSiriShortcutOn, forKey: "isSiriShortcutOn")
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
            .previewLayout(.fixed(width: 280, height: 250))
    }
}

extension View {
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}
