//
//  TranslationView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 08/11/21.
//

import SwiftUI

struct TranslationView: View {

    @StateObject var manager = LocationManagerService()
    @StateObject private var translationViewModel = TranslationViewModel()
    @State private var isMenuListHidden: Bool = true
    @State private var isLeft: Bool = true
    @State private var transcript = ""
    @State private var isRecording = false
    private let speechRecognizer = DictationService()

    var body: some View {
        ZStack {
            Color("Off-Color").ignoresSafeArea()

            VStack(spacing: 0) {
                LanguageSettingView()
                    .disabled(isRecording)

                TranslationHistoryView()
                    .padding(.top, 21)

                ZStack(alignment: .bottom) {
                    TextFieldTranslationView(
                        text: $translationViewModel.originText,
                        isDisable: $isRecording,
                        onEditingEnded: {
                            translationViewModel.translate(
                                originLangCode: translationViewModel.leftLangCode,
                                destLangCode: translationViewModel.rightLangCode, isVoice: false)
                        })
                        .disabled(!isMenuListHidden)
                        .keyboardResponsive()

                        HStack {
                            Spacer()

                            VoiceButtonGroup(
                                playLeftVoiceButton: {
                                    isLeft = true
                                    listenAndTranslate()
                                }, stopLeftVoiceButton: {
                                    stopRecording()
                                }, playRightVoiceButton: {
                                    isLeft = false
                                    listenAndTranslate()
                                }, stopRightVoiceButton: {
                                    stopRecording()
                                }
                            )
                            MenuButtonView(toggleMenuButton: {
                                isMenuListHidden.toggle()
                            })
                                .padding(9)

                        }
                        .padding(.trailing, 26)
                        .padding(.bottom, 30)

                }
            }

            if !isMenuListHidden {
                GeometryReader { geometry in
                    Button {
                        isMenuListHidden.toggle()
                    } label: {
                        Text("")
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }

                VStack {
                    Spacer()

                    HStack {
                        Spacer()

                        MenuListView(
                            toggleAutoPlayButton: {isMenuListHidden.toggle()},
                            toggleAutoDetectLanguageButton: {isMenuListHidden.toggle()},
                            toggleSiriShortcutButton: {isMenuListHidden.toggle()},
                            toggleClearHistoryButton: {isMenuListHidden.toggle()}
                        )
                            .opacity(0.95)
                            .padding(.bottom, 94.5)
                            .padding(.trailing, 25)
                    }
                }

            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }

}

extension TranslationView {

    func listenAndTranslate() {
        translationViewModel.originText = "Listening..."
        if isLeft {
            speechRecognizer.changeLocale(locale: translationViewModel.leftLangCode)
        } else {
            speechRecognizer.changeLocale(locale: translationViewModel.rightLangCode)
        }

        isRecording = true
        speechRecognizer.record(to: $transcript)

    }

    func stopRecording() {
        isRecording = false
        speechRecognizer.stopRecording()
        translationViewModel.originText = transcript

        if isLeft {
            translationViewModel.translate(originLangCode: translationViewModel.leftLangCode,
                                           destLangCode: translationViewModel.rightLangCode,
                                           isVoice: true)
        } else {
            translationViewModel.translate(originLangCode: translationViewModel.rightLangCode,
                                           destLangCode: translationViewModel.leftLangCode,
                                           isVoice: true)
        }
    }

}

struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView()
    }
}
