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
    @State var title = "Translate From"
    var body: some View {
        HStack(spacing: 35) {
            LanguageButtonView(toggleLanguageButton: {
                isOrigin = true
                showLanguageListModalView = true
                title = "Translate From"
            },
                               imageName: $LanguageSettingVM.countryImageOrigin,
                               countryName: $LanguageSettingVM.countryNameButtonOrigin,
                               colorName: $LanguageSettingVM.colorNameButtonOrigin
            )
            LanguageButtonView(toggleLanguageButton: {
                isOrigin = false
                showLanguageListModalView = true
                title = "Translate To"
            },
                               imageName: $LanguageSettingVM.countryImageDestination,
                               countryName: $LanguageSettingVM.countryNameButtonDestination,
                               colorName: $LanguageSettingVM.colorNameButtonDestination
            )
        }
        .padding(.top, 8)
        .sheet(isPresented: $showLanguageListModalView) {
            LanguageListView(isOrigin: self.isOrigin, title: self.$title, showModal: self.$showLanguageListModalView)
        }
    }
}

struct LanguageSettingView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSettingView()
    }
}
