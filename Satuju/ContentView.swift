//
//  ContentView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 27/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var autoPlayCheck: Bool = UserDefaults.standard.bool(forKey: "autoPlayCheck")
    @State var detectLanguageCheck: Bool = UserDefaults.standard.bool(forKey: "detectLanguageCheck")
    @State var menuListHidden: Bool = true
    @State var menuButtonLocation = CGPoint()
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    MenuButtonView(toggleMenuButton: {
                        menuListHidden = !menuListHidden
                    })
                        .padding(9)
                }.padding(.trailing, 26)
            }
            if !menuListHidden {
                MenuListView()
                    .position(x: 273, y: 658)
                    .opacity(0.90)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
