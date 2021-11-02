//
//  ContentView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 27/10/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManagerService()
    @StateObject var viewModel = TranslationViewModel()
    @State var autoPlayCheck: Bool = UserDefaults.standard.bool(forKey: "autoPlayCheck")
    @State var detectLanguageCheck: Bool = UserDefaults.standard.bool(forKey: "detectLanguageCheck")
    @State var menuListHidden: Bool = false
    @State var menuButtonLocation = CGPoint()
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    LanguageButtonView(toggleLanguageButton: { viewModel.changeLanguageButtonOrigin()
                    }, imageName: $viewModel.imageNameButtonOrigin, countryName: $viewModel.countryNameButtonOrigin)
                    SwitchButton()
                        .padding(10)
                    LanguageButtonView(toggleLanguageButton: {
                        viewModel.changeLanguageButtonDestination()
                    }, imageName: $viewModel.imageNameButtonDestination, countryName: $viewModel.countryNameButtonDestination)
                }.padding(.top, 6)
                Spacer()
                HStack {
                    Spacer()
                    MenuButtonView(toggleMenuButton: {
                        menuListHidden = !menuListHidden
                    })
                        .padding(9)
//                        .overlay(
//                            GeometryReader { geometry in
//                                Color.clear
//                                    .onAppear {
//                                        MenuListView()
//                                            .position(x: geometry.safeAreaInsets.leading, y: geometry.safeAreaInsets.top)
//                                            .opacity(0.90)
//                                        print(geometry.safeAreaInsets.bottom)
//                                    }
//                            }
//                        )
                }.padding(.trailing, 26)
            }
            VStack {
                Spacer()
                HStack {
                    DetectLanguageButtonView()
                }.padding(9)
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
