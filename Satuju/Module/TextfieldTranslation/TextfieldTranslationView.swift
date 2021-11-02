//
//  TextfieldTranslationView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 02/11/21.
//

import SwiftUI

struct TextfieldTranslationView: View {
    @State var isClick: Bool = false
    @Namespace var namespace
    @State var isDisable = false
    var body: some View {
        ZStack {
            Color("DividerColor")
            VStack {
                Spacer()
                ZStack {
                    VStack {
                        HStack {
                            Text("Tap or Speak to Translate")
                                .font(.custom("NotoSans-Bold", size: 22))
                                .foregroundColor(Color("DividerColor"))
                            Spacer()
                        }.onTapGesture {
                            withAnimation(
                                .spring(
                                    response: 0.5,
                                    dampingFraction: 0.7,
                                    blendDuration: 0)) {
                                        isClick.toggle()
                                        isDisable = true
                                    }
                        }
                        .disabled(isDisable)
                        Spacer()
                    }
                    .padding(20)
                    .frame(width: 390, height: 300)
                    .background(
                        RoundedCornersShape(
                            corners: [.topLeft, .topRight],
                            radius: 10
                        )
                        .fill(Color.white)
                    )
                    .matchedGeometryEffect(id: "TFTranslation", in: namespace, isSource: !isClick)
                    .zIndex(1)
                    if isClick {
                        ZStack(alignment: .topTrailing) {
                            VStack {
                                TextFieldCard(onEditingEnded: {
                                    isClick.toggle()
                                    isDisable = false
                                })
                                    .matchedGeometryEffect(id: "TFTranslation", in: namespace)
                                    .frame(idealWidth: 390, maxHeight: 700)
                                    .transition(AnyTransition.opacity)
                            }
                            CloseButton()
                                .padding(.all, 20)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        isClick.toggle()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            isDisable = false
                                        }
                                    }
                                }
                        }
                        .zIndex(2)
                    }
                }
                .transition(
                    .asymmetric(
                        insertion: AnyTransition
                            .opacity
                            .animation(Animation.spring().delay(0.7)),
                        removal: AnyTransition
                            .opacity
                            .animation(Animation.spring())
                    )
                )
            }
        }
        .ignoresSafeArea()
    }
}

struct TextfieldTranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldTranslationView()
    }
}
