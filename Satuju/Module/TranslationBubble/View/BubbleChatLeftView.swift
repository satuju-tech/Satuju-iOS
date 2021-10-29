//
//  BubbleChatLeftView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 29/10/21.
//

import SwiftUI

struct BubbleChatLeftView: View {
    var textTranslationInput: String
    var textTranslationResult: String
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            PolygonShapeView()
                .zIndex(1)
            TextTranslationBubbleView(
                textTranslationInput: textTranslationInput,
                textTranslationResult: textTranslationResult
            )
        }
        .padding(.bottom, 20)
    }
}

struct BubbleChatLeftView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleChatLeftView(
            textTranslationInput: "Hello I'm from Saudi arabia, and now i want to talk with you guys",
            textTranslationResult: "Halo, saya dari arab saudi, dan saya ingin berbicara dengan anda"
        )
        .previewLayout(.sizeThatFits)
    }
}
