//
//  LanguageSettingView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 07/11/21.
//

import SwiftUI

struct LanguageSettingView: View {
    @StateObject private var TranslationBubbleVM = TranslationBubbleViewModel()
    @StateObject private var LanguageSettingVM = LanguageSettingViewModel()
    @State var showLanguageListModalView: Bool = false
    var body: some View {
        HStack {
            LanguageButtonView(toggleLanguageButton: {
                LanguageSettingVM.changeLanguageButtonOrigin()
                showLanguageListModalView = true
            },
                               imageName: $LanguageSettingVM.imageNameButtonOrigin,
                               countryName: $LanguageSettingVM.countryNameButtonOrigin,
                               colorName: $LanguageSettingVM.colorNameButtonOrigin
            )
            if !TranslationBubbleVM.isDetectLanguageOn {
                SwitchButton(action: {LanguageSettingVM.switchButton()})
            } else {
                SwitchButton(action: {LanguageSettingVM.switchButton()}).hidden()
            }
            LanguageButtonView(toggleLanguageButton: {
                LanguageSettingVM.changeLanguageButtonDestination()
                showLanguageListModalView = true
            },
                               imageName: $LanguageSettingVM.imageNameButtonDestination,
                               countryName: $LanguageSettingVM.countryNameButtonDestination,
                               colorName: $LanguageSettingVM.colorNameButtonDestination
            )
        }.sheet(isPresented: $showLanguageListModalView) {
            LanguageListView()
        }
    }
}

struct LanguageSettingView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSettingView()
    }
}
