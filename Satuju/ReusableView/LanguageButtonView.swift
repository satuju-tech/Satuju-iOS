//
//  LanguageButtonView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 29/10/21.
//

import SwiftUI

struct LanguageButtonView: View {
    @State var toggleLanguageButton: (() -> Void)
    @Binding var imageName: String
    @Binding var countryName: String
    var body: some View {
        Button(action: {
            toggleLanguageButton()
        }, label: {
            HStack(spacing: 8) {
                Image(imageName)
                    .resizable()
                    .frame(width: 37.35, height: 37.35 )
                    .clipShape(Circle())
                    .padding(3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.white)
                    )
                Text(countryName)
                    .font(.custom("NotoSans-Bold", size: 12))
                    .foregroundColor(.white)
            }
            .frame(width: 147, height: 60, alignment: .leading)
            .padding(.leading, 8.0)
            .background(LinearGradient(gradient: Gradient(colors: [Color("AquaSecondary"), Color("PurplePrimary")]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 53))
        })
    }
}
