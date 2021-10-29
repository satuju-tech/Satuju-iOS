//
//  TextTranslationBubbleView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 29/10/21.
//

import SwiftUI

struct TextTranslationBubbleView: View {
    var textTranslationInput: String
    var textTranslationResult: String
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 10) {
                Text(textTranslationInput)
                    .font(
                        .custom("NotoSans-Bold", size: 15)
                    )
                Divider()
                    .background(Color("DividerColor"))
                Text(textTranslationResult)
                    .font(
                        .custom("NotoSans-Bold", size: 15)
                    )
                    .foregroundColor(Color("PurplePrimary"))
            }
            .frame(maxWidth: 278)
            VStack {
                HStack {
                    Spacer()
                    ButtonReplayView(action: {})
                }
            }
            .frame(maxWidth: 278)
        }
        .padding(.init(top: 24, leading: 32, bottom: 24, trailing: 32))
        .frame(maxWidth: 342, minHeight: 156)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 12
            )
        )
        .shadow(color: Color("ShadowColor"), radius: 10, x: 0, y: 6)
    }
}

struct TextTranslationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextTranslationBubbleView(
                textTranslationInput: "This is two hundred won, i just want to know ypurhnekbjax",
                textTranslationResult: "Ini adalah dua ratus won"
            )
            .previewLayout(.sizeThatFits)
            .padding()
            TextTranslationBubbleView(
                textTranslationInput: "This is two hundred won, i just want to know ypurhnekbjax",
                textTranslationResult: "Ini adalah dua ratus won"
            )
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}
