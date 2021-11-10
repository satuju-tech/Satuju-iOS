//
//  ButtonReplayView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 29/10/21.
//

import SwiftUI

struct ButtonReplayView: View {

    var action: () -> Void

    var body: some View {
        Button {
           action()
        } label: {
            Image("playIcon")
                .resizable()
                .frame(width: 11, height: 12)
                .padding(.init(top: 10.65, leading: 11.25, bottom: 9.65, trailing: 10))
                .background(
                    Circle()
                        .foregroundColor(
                            Color("PurplePrimary")
                        )
            )
        }
    }
}

struct ButtonReplayView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonReplayView(action: {})
            .previewLayout(.sizeThatFits)
    }
}
