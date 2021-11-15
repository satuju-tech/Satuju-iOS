//
//  TranslationBubble.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 01/11/21.
//

import SwiftUI

struct TranslationBubble: View {

    @State var isLeft: Bool
    var action: () -> Void
    var textTranslationInput: String
    var textTranslationResult: String
    var destinationLangCode: String

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            PolygonShapeView()
                .zIndex(1)
                .rotation3DEffect(isLeft ? .degrees(0) : .degrees(180), axis: (x: 0, y: 1, z: 0))

            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(textTranslationInput)
                        .font(
                            .custom("NotoSans-Bold", size: 15)
                        )
                        .frame(maxWidth: 250, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            action()
                        }
                        .padding(.bottom, 10)
                    Divider()
                        .background(Color("Off-Color"))
                    HStack(alignment: .bottom) {
                        Text(textTranslationResult)
                            .font(
                                .custom("NotoSans-Bold", size: 15)
                            )
                            .frame(maxWidth: 250, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 10)
                        .foregroundColor(Color("PurplePrimary"))
                        ButtonReplayView {
                            TextToVoiceService().speak(read: textTranslationResult, language: destinationLangCode)
                        }
                    }
                    .padding(.top, 10)
                }
                .frame(maxWidth: 278)
            }
            .padding(.init(top: 24, leading: 32, bottom: 24, trailing: 32))
            .background(Color.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12
                )
            )
            .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 6)
            .environment(\.layoutDirection, .leftToRight)
        }
        .environment(\.layoutDirection, isLeft ? .leftToRight : .rightToLeft)

    }
}

struct TranslationBubble_Previews: PreviewProvider {
    static var previews: some View {
        TranslationBubble(
            isLeft: false,
            action: {},
            textTranslationInput: "This is two hundred won, i just want to know ypurhnekbjax",
            textTranslationResult: "Ini adalah dua ratus won yang",
            destinationLangCode: "id")
            .previewLayout(.sizeThatFits)
            .padding()
        TranslationBubble(
            isLeft: true, action: {},
            textTranslationInput: "This is two hundred won, i just want to know ypurhnekbjax",
            textTranslationResult: "Ini adalah dua ratus won, aku hanya ingin tau  ypurhnekbjax nckewnklf dknwndoiwe ndonweodnw ndionweoind ndionwdn",
            destinationLangCode: "id")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
