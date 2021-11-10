//
//  MenuListView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 29/10/21.
//

import SwiftUI

struct MenuListView: View {

    @StateObject private var viewModel = TranslationBubbleViewModel()

    var body: some View {
        List {
            Button(action: {viewModel.toggleAutoPlayButton()}, label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(viewModel.isAutoPlayOn ? .black : .clear)

                    Text("Auto Play Translation")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .frame(maxWidth: 300, alignment: .leading)
                }.contentShape(Rectangle())
            })
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))

            Button(action: {viewModel.toggleAutoDetectLanguageButton()}, label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(viewModel.isDetectLanguageOn ? .black : .clear)

                    Text("Detect Language")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .frame(maxWidth: 300, alignment: .leading)
                }
                .contentShape(Rectangle())
            })
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            Button(action: {viewModel.toggleSiriShortcutButton()}, label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(viewModel.isSiriShortcutOn ? .black : .clear)
                    Text("Siri Shortcut")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .frame(maxWidth: 300, alignment: .leading)
                }.contentShape(Rectangle())
            })
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            Button(action: {viewModel.toggleDeleteHistoryButton()}, label: {
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
        .onAppear {UITableView.appearance().backgroundColor = UIColor.clear}
    }

}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
            .previewLayout(.fixed(width: 280, height: 250))
            .opacity(0.95)
    }
}
