//
//  CloseButton.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 02/11/21.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 17, weight: .black))
            .foregroundColor(Color("PurplePrimary"))
            .padding(.all, 10)
            .background(Color("Purple"))
            .mask(Circle())
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
