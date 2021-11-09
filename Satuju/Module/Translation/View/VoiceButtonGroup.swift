//
//  VoiceButtonGroup.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 08/11/21.
//

import SwiftUI

struct VoiceButtonGroup: View {
    var body: some View {
        HStack(spacing: 25) {
            DetectLanguageButtonView(action: {

            })

            DetectLanguageButtonView(action: {

            })
        }
    }
}

struct VoiceButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        VoiceButtonGroup()
    }
}
