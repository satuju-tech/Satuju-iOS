//
//  KeyboardViewModifier.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 09/11/21.
//

import Foundation
import SwiftUI

struct KeyboardViewModifier: ViewModifier {
    @State var offset: CGFloat = 0

    func body(content: Content) -> some View {
        content.offset(y: -1 * offset).onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                if let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    let frame = value.cgRectValue
                    let height = frame.size.height
                    self.offset = height
                }
            }

            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                self.offset = 0
            }
        }
    }
}

extension View {
    func keyboardResponsive() -> ModifiedContent<Self, KeyboardViewModifier> {
        return modifier(KeyboardViewModifier())
    }
}
