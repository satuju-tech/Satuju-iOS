//
//  DetectLanguageButton.swift
//  Satuju
//
//  Created by Gede Wicaksana on 02/11/21.
//

import SwiftUI

struct DetectLanguageButtonView: View {
    var body: some View {
        Button {
        } label: {
            Label(
                title: {},
                icon: { Image("micIcon")
                        .resizable()
                        .frame(width: 27, height: 41, alignment: .center)
                        .foregroundColor(.white)
                        .frame(width: 66, height: 66, alignment: .center)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("AquaSecondary"), Color("PurplePrimary")]), startPoint: .top, endPoint: .bottom))
                        .clipShape(Circle())
                }
            )
        }
    }
}

struct DetectLanguageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DetectLanguageButtonView()
    }
}
