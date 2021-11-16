//
//  SwitchButton.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 27/10/21.
//

import SwiftUI

struct SwitchButton: View {

    @AppStorage("leftLangCode") var leftCountryCode: String?
    @AppStorage("leftLangName") var leftCountryNameButton: String?
    @AppStorage("leftLangImage") var leftCountryImageName: String?
    @AppStorage("rightLangCode") var rightCountryCode: String?
    @AppStorage("rightLangName") var rightCountryNameButton: String?
    @AppStorage("rightLangImage") var rightCountryImageName: String?

    var body: some View {
        Button {
            let tempLanguageCode = leftCountryCode
            let tempLanguageName = leftCountryNameButton
            let tempLanguageImage = leftCountryImageName
            leftCountryCode = rightCountryCode
            leftCountryNameButton = rightCountryNameButton
            leftCountryImageName = rightCountryImageName
            rightCountryCode = tempLanguageCode
            rightCountryNameButton = tempLanguageName
            rightCountryImageName = tempLanguageImage
        } label: {
            Image("SwitchIcon")
                .resizable()
                .frame(width: 23.4, height: 23.18)
                .foregroundColor(Color("Purple"))
        }
    }

}

struct SwitchButton_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButton()
            .previewLayout(.fixed(width: 48, height: 48))
    }
}
