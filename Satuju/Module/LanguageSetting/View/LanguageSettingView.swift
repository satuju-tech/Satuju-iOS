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
        HStack(spacing: 35) {
            LanguageButtonView(toggleLanguageButton: {
                isOrigin = true
                showLanguageListModalView = true
            },
                               imageName: $LanguageSettingVM.imageNameButtonOrigin,
                               countryName: $LanguageSettingVM.countryNameButtonOrigin,
                               colorName: $LanguageSettingVM.colorNameButtonOrigin
            )
            LanguageButtonView(toggleLanguageButton: {
                isOrigin = false
                showLanguageListModalView = true
            },
                               imageName: $LanguageSettingVM.imageNameButtonDestination,
                               countryName: $LanguageSettingVM.countryNameButtonDestination,
                               colorName: $LanguageSettingVM.colorNameButtonDestination
            )
        }
        .padding(.top, 8)
        .sheet(isPresented: $showLanguageListModalView) {
            LanguageListView(isOrigin: self.isOrigin, showModal: self.$showLanguageListModalView)
        }
    }
}

struct LanguageSettingView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSettingView()
    }
}
