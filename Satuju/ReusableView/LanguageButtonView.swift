//
//  LanguageButtonView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//

import SwiftUI

struct LanguageButtonView: View {
    @State var toggleLanguageButton: (() -> Void)
    @Binding var imageName: String
    @Binding var countryName: String
    @Binding var colorName: String
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
            .background(Color(colorName))
            .clipShape(RoundedRectangle(cornerRadius: 53))
        })
    }
}
