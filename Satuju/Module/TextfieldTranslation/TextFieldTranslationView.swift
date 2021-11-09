//
//  TextFieldCard.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 02/11/21.
//

import SwiftUI

struct TextFieldTranslationView: View {
    @Binding var text: String
    @State private var placeholder: String = "Enter Text"
    @State private var value: CGFloat = 0
    @State private var isFirstResponder = false
    @State private var isFirstTap: Bool = false
    @State private var isClick: Bool = false
    @State private var isButtonCloseHidden: Bool = false
    var onEditingEnded: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            if isButtonCloseHidden {
                HStack {
                    Spacer()
                    Image(systemName: "xmark")
                        .font(.system(size: 17, weight: .black))
                        .foregroundColor(Color("PurplePrimary"))
                        .padding(.all, 10)
                        .background(Color("Purple"))
                        .mask(Circle())
                        .onTapGesture {
                            self.dismissKeyboard()
                            isButtonCloseHidden.toggle()
                            text = ""
                        }
                }
            }
            TextEditor(text: $text)
                .keyboardType(.asciiCapable)
                .disableAutocorrection(true)
                .onAppear(perform: {
                    if text.isEmpty {
                        text = placeholder
                    }
                })
                .font(.custom("NotoSans-Bold", size: 22))
                .foregroundColor(Color("DividerColor"))
                .onTapGesture {
                    if !isFirstTap {
                        self.text = ""
                        isFirstTap.toggle()
                    }
                    isButtonCloseHidden.toggle()
                }
                .onChange(of: text) { value in
                    if value.contains("\n") {
                        text = value.replacingOccurrences(of: "\n", with: "")
                        self.dismissKeyboard()
                        self.onEditingEnded()
                        isButtonCloseHidden.toggle()
                    }
                }
                .zIndex(2)
        }
        .padding(20)
        .background(
            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 10)
                .fill(Color.white)
        )
    }
}

struct TextFieldCard_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTranslationView(
            text: .constant("Enter Text"),
            onEditingEnded: {}
        )
    }
}

extension View {
  func  dismissKeyboard() {
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        keyWindow?.endEditing(true)
    }
}
