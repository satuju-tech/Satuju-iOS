//
//  VoiceRecognitionView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 05/11/21.
//

import SwiftUI

struct VoiceRecognitionView: View {

    @ObservedObject var voiceRecognitionViewModel = VoiceRecognitionViewModel()

    var body: some View {

        if !voiceRecognitionViewModel.isAutoDetectLanguageHidden {
            DetectLanguageButtonView(action: {
                voiceRecognitionViewModel.autoDetectLanguageButtonClicked()
            })
        }

    }

}

struct VoiceRecognitionView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceRecognitionView()
    }
}
