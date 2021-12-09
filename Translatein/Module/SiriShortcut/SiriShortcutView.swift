//
//  SiriShortcutView.swift
//  Translatein
//
//  Created by Gede Wicaksana on 08/12/21.
//

import SwiftUI

struct SiriShortcutView: View {

    @AppStorage("isVoiceTranslationShortcutAdded") var isVoiceTranslationShortcutAdded: Bool = false
    @AppStorage("isTextTranslationShortcutAdded") var isTextTranslationShortcutAdded: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color("Off-Color").ignoresSafeArea()

            VStack {
                VStack(spacing: 20) {
                    HStack {
                        Spacer()

                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Done")
                                .font(.custom("NotoSans-Bold", size: 17))
                        }
                    }

                    LinearGradient(gradient: Gradient(colors: [Color("PurplePrimary"), Color("AquaSecondary")]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 180, height: 22)
                        .mask(Text("Translatein").font(.custom("NotoSans-Bold", size: 22)))

                    Text("Siri Shortcut")
                        .font(.custom("NotoSans-Bold", size: 15))
                        .padding(.bottom, 21)
                }.padding()

                VStack(spacing: 20) {
                    if isTextTranslationShortcutAdded || isVoiceTranslationShortcutAdded {
                        HStack {
                            Text("YOUR SHORTCUT")
                                .font(.custom("NotoSans-Bold", size: 15))
                                .foregroundColor(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
                                .opacity(0.35)
                                .padding(.leading, 20)
                            Spacer()
                        }

                        HStack(spacing: 20) {
                            if isVoiceTranslationShortcutAdded {
                                SiriShortcutItemCard(
                                    action: { voiceTranslationShortcutClicked() },
                                    title: "Voice Translation",
                                    desc: "Fastest way to translate your conversation",
                                    imageName: "micIcon",
                                    iconColor: Color("PurplePrimary"))
                            }

                            if isTextTranslationShortcutAdded {
                                SiriShortcutItemCard(
                                    action: { textTranslationShortcutClicked() },
                                    title: "Text Translation",
                                    desc: "Fastest way to translate your text",
                                    imageName: "keyboardIcon",
                                    iconColor: Color("AquaSecondary"))
                            }

                            if (!isVoiceTranslationShortcutAdded && isTextTranslationShortcutAdded)
                                ||
                                (isVoiceTranslationShortcutAdded && !isTextTranslationShortcutAdded) {
                                Spacer()
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                    }

                    if !isTextTranslationShortcutAdded || !isVoiceTranslationShortcutAdded {
                        HStack {
                            Text("ADD SHORTCUT")
                                .font(.custom("NotoSans-Bold", size: 15))
                                .foregroundColor(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
                                .opacity(0.35)
                                .padding(.leading, 20)
                            Spacer()
                        }

                        HStack(spacing: 20) {
                            if !isVoiceTranslationShortcutAdded {
                                SiriShortcutItemCard(
                                    action: { voiceTranslationShortcutClicked() },
                                    title: "Voice Translation",
                                    desc: "Fastest way to translate your conversation",
                                    imageName: "micIcon",
                                    iconColor: Color("PurplePrimary"))
                            }

                            if !isTextTranslationShortcutAdded {
                                SiriShortcutItemCard(
                                    action: { textTranslationShortcutClicked() },
                                    title: "Text Translation",
                                    desc: "Fastest way to translate your text",
                                    imageName: "keyboardIcon",
                                    iconColor: Color("AquaSecondary"))
                            }

                            if (!isVoiceTranslationShortcutAdded && isTextTranslationShortcutAdded)
                                ||
                                (isVoiceTranslationShortcutAdded && !isTextTranslationShortcutAdded) {
                                Spacer()
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                    }
                    Spacer()
                }
            }
        }
    }
}

struct SiriShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        SiriShortcutView()
    }
}

extension SiriShortcutView {

    func voiceTranslationShortcutClicked() {
        print("voiceTranslationShortcutClicked")
    }

    func textTranslationShortcutClicked() {
        print("textTranslationShortcutClicked")
    }
}

struct SiriShortcutItemCard: View {

    @State var action: (() -> Void)
    @State var title: String
    @State var desc: String
    @State var imageName: String
    @State var iconColor: Color

    var body: some View {

        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("NotoSans-Bold", size: 15))
                .foregroundColor(Color.black)
                .padding(.bottom, 10)

            Text(desc)
                .font(.custom("NotoSans-Regular", size: 11))
                .foregroundColor(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
                .opacity(0.35)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 19)

            ZStack {
                Circle()
                    .frame(width: 36, height: 36)
                    .foregroundColor(iconColor)

                Image(imageName)
                    .resizable()
                    .frame(width: title == "Text Translation" ? 20 : 15, height: title == "Text Translation" ? 14 : 23)
            }
        }
        .frame(maxWidth: 165, maxHeight: 143, alignment: .leading)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 7, trailing: 10))
        .background(Color.white)
        .cornerRadius(10)
        .onTapGesture {
            action()
        }
    }
}
