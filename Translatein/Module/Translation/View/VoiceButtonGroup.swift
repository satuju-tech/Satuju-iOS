//
//  VoiceButtonGroup.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 08/11/21.
//

import SwiftUI

struct VoiceButtonGroup: View {

    let playLeftVoiceButton: () -> Void
    let stopLeftVoiceButton: () -> Void
    let playRightVoiceButton: () -> Void
    let stopRightVoiceButton: () -> Void

    @State private var isMicLeftDisable: Bool = false
    @State private var isMicRightDisable: Bool = false

    var body: some View {
        HStack(spacing: 25) {
            MicButton(playAction: {
                playLeftVoiceButton()
                isMicRightDisable = true
            }, stopAction: {
                stopLeftVoiceButton()
                isMicRightDisable = false
            }, color: Color("PurplePrimary"))
                .disabled(isMicLeftDisable)

            MicButton(playAction: {
                playRightVoiceButton()
                isMicLeftDisable = true
            }, stopAction: {
                stopRightVoiceButton()
                isMicLeftDisable = false
            }, color: Color("AquaSecondary"))
                .disabled(isMicRightDisable)
        }
    }

}

struct VoiceButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        VoiceButtonGroup {

        } stopLeftVoiceButton: {

        } playRightVoiceButton: {

        } stopRightVoiceButton: {

        }
    }
}
