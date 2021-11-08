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
    @State var isOrigin = true
    var body: some View {
        HStack {
            LanguageButtonView(toggleLanguageButton: {
                //                LanguageSettingVM.changeLanguageButtonOrigin()
                isOrigin = true
                showLanguageListModalView = true
            },
                               imageName: $LanguageSettingVM.imageNameButtonOrigin,
                               countryName: $LanguageSettingVM.test,
                               colorName: $LanguageSettingVM.colorNameButtonOrigin
            )
            if !TranslationBubbleVM.isDetectLanguageOn {
                SwitchButton(action: {LanguageSettingVM.switchButton()})
            } else {
                SwitchButton(action: {LanguageSettingVM.switchButton()}).hidden()
            }
            LanguageButtonView(toggleLanguageButton: {
                isOrigin = false
//                LanguageSettingVM.changeLanguageButtonDestination()
                showLanguageListModalView = true
            },
                               imageName: $LanguageSettingVM.imageNameButtonDestination,
                               countryName: $LanguageSettingVM.countryNameButtonDestination,
                               colorName: $LanguageSettingVM.colorNameButtonDestination
            )
        }.sheet(isPresented: $showLanguageListModalView) {
            LanguageListView(isOrigin: isOrigin, showModal: self.$showLanguageListModalView)
        }
    }
}

struct LanguageSettingView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSettingView()
    }
}
