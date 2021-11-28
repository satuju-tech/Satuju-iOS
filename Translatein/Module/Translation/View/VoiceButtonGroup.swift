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
    @State private var isMicLeftDisable: Bool = false
    @State private var isMicRightDisable: Bool = false

    var body: some View {
        HStack(spacing: 25) {
            MicButton(action: {
                actionLeftVoiceButton()
                isMicRightDisable.toggle()
            }, color: Color("PurplePrimary"))
                .disabled(isMicLeftDisable)

            MicButton(action: {
                actionRightVoiceButton()
                isMicLeftDisable.toggle()
            }, color: Color("AquaSecondary"))
                .disabled(isMicRightDisable)
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
