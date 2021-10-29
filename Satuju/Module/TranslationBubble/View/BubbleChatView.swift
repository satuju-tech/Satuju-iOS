//
//  BubbleChatView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 29/10/21.
//

import SwiftUI

struct BubbleChatView: View {
    var isOrigin: Bool = true
    var textTranslationInput: String
    var textTranslationResult: String
    @ViewBuilder
    var body: some View {
        if isOrigin {
            BubbleChatLeftView(
                textTranslationInput: textTranslationInput,
                textTranslationResult: textTranslationResult
            )
        } else {
            BubbleChatRightView(
                textTranslationInput: textTranslationInput,
                textTranslationResult: textTranslationResult
            )
        }
    }
}

struct BubleChatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BubbleChatView(
                isOrigin: true,
                textTranslationInput: "Hello I'm from Saudi arabia, and now i want to talk with you guys",
                textTranslationResult: "Halo, saya dari arab saudi, dan saya ingin berbicara dengan anda"
            )
            .previewDevice("iPhone SE")
            BubbleChatView(
                isOrigin: false,
                textTranslationInput: "Hello I'm from Saudi arabia, and now i want to talk with you guys",
                textTranslationResult: "Halo, saya dari arab saudi, dan saya ingin berbicara dengan anda"
            )
        }
    }
}
