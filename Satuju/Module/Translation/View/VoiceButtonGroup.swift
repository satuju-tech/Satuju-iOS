//
//  VoiceButtonGroup.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 08/11/21.
//

import SwiftUI

struct VoiceButtonGroup: View {

    let actionLeftVoiceButton: () -> Void
    let actionRightVoiceButton: () -> Void

    var body: some View {
        HStack(spacing: 25) {
            DetectLanguageButtonView(action: {
                actionLeftVoiceButton()
            })

            DetectLanguageButtonView(action: {
                actionRightVoiceButton()
            })
        }
    }

}

struct VoiceButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        VoiceButtonGroup {

        } actionRightVoiceButton: {

        }

    }
}
