//
//  TextToVoiceService.swift
//  Satuju
//
//  Created by Gede Wicaksana on 01/11/21.
//

import AVFoundation

final class TextToVoiceService: NSObject {
    func speak(read: String, language: String) {
        let utterance = AVSpeechUtterance(string: read)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = 0.4
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
}
