//
//  TranslationView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 08/11/21.
//

import SwiftUI

struct TranslationView: View {
    @StateObject var manager = LocationManagerService()
    @State var isMenuListHidden: Bool = true
    @State var originText: String = ""
    @StateObject var translationViewModel = TranslationViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                LanguageSettingView()
                TranslationHistoryView()
                    .padding(.top, 88)
                ZStack(alignment: .bottom) {
                    TextfieldTranslationView(action: {
                        translationViewModel.translate()
                    }, text: $translationViewModel.originText)
                    HStack {
                        Spacer()
                        VoiceButtonGroup()
                        MenuButtonView(toggleMenuButton: {
                            isMenuListHidden.toggle()
                        })
                            .padding(9)
                    }.padding(.trailing, 26)
                        .padding(.bottom, 30)
                }
            }
            VStack {
                Spacer()
                if !isMenuListHidden {
                    HStack {
                        Spacer()
                        MenuListView()
                            .opacity(0.95)
                            .padding(.bottom, 73)
                            .padding(.trailing, 9)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView()
    }
}
