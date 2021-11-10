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
    @State var isFocused: Bool = false

    var onEditingEnded: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            if isFocused {
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
                            isFocused.toggle()
                            text = placeholder
                        }
                }
            }

            TextEditor(text: $text)
                .keyboardType(.asciiCapable)
                .disableAutocorrection(true)
                .onAppear(perform: {
                    if !isFocused {
                        text = placeholder
                    }
                })
                .font(.custom("NotoSans-Bold", size: 22))
                .foregroundColor(Color("DividerColor"))
                .onTapGesture {
                    if !isFocused {
                        self.text = ""
                        isFocused.toggle()
                    }

                }
                .onChange(of: text) { value in
                    if value.contains("\n") {
                        text = value.replacingOccurrences(of: "\n", with: "")
                        self.dismissKeyboard()
                        self.onEditingEnded()
                        isFocused.toggle()
                    }
                }
                .zIndex(2)
        }
        .frame(minHeight: isFocused ? 390 : 305)
        .padding(20)
        .background(
            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 10)
                .fill(Color.white)
        )
        .offset(y: isFocused ? 31 : 0)
    }
}

struct TextFieldCard_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTranslationView(
            text: .constant("Enter Text"),
            onEditingEnded: {}
        )
            .previewLayout(.sizeThatFits)
    }
}

extension View {

  func dismissKeyboard() {
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        keyWindow?.endEditing(true)
    }

}
