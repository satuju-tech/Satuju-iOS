//
//  LanguageButtonView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 29/10/21.
//

import SwiftUI

struct LanguageButtonView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image("INA")
                .resizable()
                .frame(width: 37.35, height: 37.35 )
                .clipShape(Circle())
                .padding(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 35)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.white)
                )
            Text("Indonesia")
                .font(.custom("NotoSans-Bold", size: 12))
                .foregroundColor(.white)
        }
        .frame(width: 147, height: 60, alignment: .leading)
        .padding(.leading, 8.0)
        .background(LinearGradient(gradient: Gradient(colors: [Color(""), Color("SecondaryColor")]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 53))
    }
}

struct LanguageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageButtonView()
    }
}
