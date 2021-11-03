//
//  ContentView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 27/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var isMenuListHidden: Bool = true
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    MenuButtonView(toggleMenuButton: {
                        isMenuListHidden.toggle()
                    })
                        .padding(9)
                }.padding(.trailing, 26)
            }
            VStack {
                Spacer()
                if !isMenuListHidden {
                    HStack {
                        Spacer()
                        MenuListView()
                            .opacity(0.95)
                            .padding(.bottom, 43)
                            .padding(.trailing, 9)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
