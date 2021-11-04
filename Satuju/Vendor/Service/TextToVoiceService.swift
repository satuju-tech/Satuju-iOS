//
//  TextToVoiceService.swift
//  Satuju
//
//  Created by Gede Wicaksana on 04/11/21.
//

import AVFoundation

final class TextToVoiceService: NSObject {
    func speak(read: String, language: String) {
        let utterance = AVSpeechUtterance(string: read)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = 0.5
        AVSpeechSynthesizer().speak(utterance)
    }
}
