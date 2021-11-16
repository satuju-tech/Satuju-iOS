//
//  LanguageSettingView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 07/11/21.
//

import SwiftUI

struct LanguageSettingView: View {

    @StateObject private var LanguageSettingVM = LanguageSettingViewModel()

    @AppStorage("isDetectLanguageOn") var isDetectLanguageOn: Bool = false

    @State var showLanguageListModalView: Bool = false
    @State var isOrigin: Bool = true
    @State var title = "Translate From"

    var body: some View {
        HStack(spacing: 10) {
            LanguageButtonView(toggleLanguageButton: {
                isOrigin = true
                showLanguageListModalView = true
                title = "Translate From"
            },
                               imageName: $LanguageSettingVM.leftCountryImageName,
                               countryName: $LanguageSettingVM.leftCountryNameButton,
                               colorName: $LanguageSettingVM.leftColorNameButton)

            if !isDetectLanguageOn {
                SwitchButton()
            } else {
                SwitchButton()
                    .hidden()
            }

            LanguageButtonView(toggleLanguageButton: {
                isOrigin = false
                showLanguageListModalView = true
                title = "Translate To"
            },
                               imageName: $LanguageSettingVM.rightCountryImageName,
                               countryName: $LanguageSettingVM.rightCountryNameButton,
                               colorName: $LanguageSettingVM.rightColorNameButton
            )
        }
        .padding(.top, 8)
        .sheet(isPresented: $showLanguageListModalView) {
            LanguageListView(isOrigin: self.$isOrigin, title: self.$title, showModal: self.$showLanguageListModalView)
        }
    }

}

struct LanguageSettingView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSettingView()
    }
}
