//
//  TextFieldCard.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 02/11/21.
//

import SwiftUI

struct TextFieldCard: View {
    @State private var name: String = "Enter Text"
    @State private var value: CGFloat = 0
    @State var isFirstResponder = false
    @State var isFirstTap: Bool = false
    var onEditingEnded: () -> Void
    var body: some View {
        VStack {
                TextEditor(text: $name)
                    .font(.custom("NotoSans-Bold", size: 22))
                    .foregroundColor(Color("DividerColor"))
                    .onTapGesture {
                        if !isFirstTap {
                            self.name = ""
                            isFirstTap.toggle()
                        }
                    }
                    .onChange(of: name) { value in
                        if value.contains("\n") {
                            name = value.replacingOccurrences(of: "\n", with: "")
                            self.dismissKeyboard()
                            self.onEditingEnded()
                        }
                    }
                    .zIndex(2)
        }
        .ignoresSafeArea(.keyboard)
        .padding(.init(top: 60, leading: 20, bottom: 20, trailing: 20))
        .background(
            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 10)
                .fill(Color.white)
        )
    }
}

struct TextFieldCard_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldCard {}

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
