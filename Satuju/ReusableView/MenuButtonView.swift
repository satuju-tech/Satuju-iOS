//
//  MenuButtonView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 29/10/21.
//

import SwiftUI

struct MenuButtonView: View {
    @State var toggleMenuButton: (() -> Void)
    var body: some View {
            VStack {
                Button(action: {
                    toggleMenuButton()
                }, label: {
                    Label(
                        title: {},
                        icon: { Image("dotIcon")
                                .resizable()
                                .frame(width: 20, height: 5, alignment: .center)
                                .foregroundColor(.white)
                                .frame(width: 48, height: 48, alignment: .center)
                                .background(Color("PurplePrimary"))
                                .clipShape(Circle())
                                .padding(9)
                        }
                    )
                })
            }
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(toggleMenuButton: {
        })
    }
}
