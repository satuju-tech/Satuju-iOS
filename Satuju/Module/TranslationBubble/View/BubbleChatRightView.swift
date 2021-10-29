//
//  BubbleChatRightView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 29/10/21.
//

import SwiftUI

struct BubbleChatRightView: View {
    var textTranslationInput: String
    var textTranslationResult: String
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            TextTranslationBubbleView(
                textTranslationInput: textTranslationInput,
                textTranslationResult: textTranslationResult
            )
            PolygonShapeView()
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .zIndex(1)
        }
        .padding(.bottom, 20)
    }
}

struct BubbleChatRightView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleChatRightView(
            textTranslationInput: "Hello I'm from Saudi arabia, and now i want to talk with you guys",
            textTranslationResult: "Halo, saya dari arab saudi, dan saya ingin berbicara dengan anda")
    }
}
