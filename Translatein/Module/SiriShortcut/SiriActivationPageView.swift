//
//  SiriActivationPageView.swift
//  Translatein
//
//  Created by Muhammad Rifki Widadi on 05/12/21.
//

import SwiftUI

struct SiriActivationPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Image("SiriImage")
                        .padding(.bottom, 30)
                    Text("Hey Siri")
                        .font(.custom("NotoSans-Bold", size: 28))
                }

                Text("Start Text Translation")
                    .font(.custom("NotoSans-Bold", size: 28))
                    .multilineTextAlignment(.center)
                    .frame(width: 262)
                    .padding(.bottom, 34)

                Text("To activate Translatein Siri Shortcut, say this phrase to Siri.")
                    .font(.custom("NotoSans-Regular", size: 15))
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                    .padding(.bottom, 34)

                Button {

                } label: {
                    Text("Change Voice Phrase")
                        .font(.custom("NotoSans-Regular", size: 15))
                }

                Spacer()

                Button {

                } label: {
                    Text("Remove Shortcut")
                        .font(.custom("NotoSans-Bold", size: 15))
                        .foregroundColor(.white)
                        .frame(width: 349, height: 50)
                        .background(
                            Rectangle()
                                .cornerRadius(8)
                                .foregroundColor(Color("PurplePrimary"))
                        )
                }.padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //
                    } label: {
                        Text("Edit in shortcut")
                    }

                }
            }
        }
    }
}

struct SiriActivationPageView_Previews: PreviewProvider {
    static var previews: some View {
        SiriActivationPageView()
    }
}
