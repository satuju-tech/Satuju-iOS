//
//  TranslationView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 08/11/21.
//

import SwiftUI

struct TranslationView: View {

    @StateObject private var translationViewModel = TranslationViewModel()

    @State private var isMenuListHidden: Bool = true
    @State private var isLeft: Bool = true
    @State private var transcript = ""
    @State private var isRecording = false

    private let speechRecognizer = DictationService()

    var body: some View {
        ZStack {
            Color("Off-Color").ignoresSafeArea()

            VStack {
                LanguageSettingView()

                TranslationHistoryView()
                    .padding(.top, 21)

                ZStack(alignment: .bottom) {
                    TextFieldTranslationView(
                        text: $translationViewModel.originText,
                        onEditingEnded: {
                            translationViewModel.translate(
                                originLangCode: translationViewModel.leftLangCode,
                                destLangCode: translationViewModel.rightLangCode)
                        })
                        .keyboardResponsive()

                    if isRecording {
                        SoundWaveView {
                            stopRecording()
                        }
                    } else {
                        HStack {
                            Spacer()

                            VoiceButtonGroup(
                                actionLeftVoiceButton: {
                                    isLeft = true
                                    listenAndTranslate()
                                },
                                actionRightVoiceButton: {
                                    isLeft = false
                                    listenAndTranslate()
                                })

                            MenuButtonView(toggleMenuButton: {
                                isMenuListHidden.toggle()
                            })
                                .padding(9)

                        }
                        .padding(.trailing, 26)
                        .padding(.bottom, 30)
                    }
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

extension TranslationView {

    func listenAndTranslate() {
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
            translationViewModel.translate(originLangCode: translationViewModel.leftLangCode, destLangCode: translationViewModel.rightLangCode)
        } else {
            translationViewModel.translate(originLangCode: translationViewModel.rightLangCode, destLangCode: translationViewModel.leftLangCode)
        }
    }

}

struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView()
    }
}
