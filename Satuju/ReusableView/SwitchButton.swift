//
//  SwitchButton.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 27/10/21.
//

import SwiftUI

struct SwitchButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
        } label: {
            Image("SwitchIcon")
                .resizable()
                .frame(width: 23.4, height: 23.18)
                .foregroundColor(Color("Purple"))
        }
    }
}

struct SwitchButton_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButton(action: {})
            .previewLayout(.fixed(width: 48, height: 48))
    }
}
