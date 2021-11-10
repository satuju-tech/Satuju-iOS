//
//  TextToVoiceService.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//

import AVFoundation

 final class TextToVoiceService: NSObject {

     func speak(read: String, language: String) {
         do {
             let audioSession = AVAudioSession()
             try audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetoothA2DP])
         } catch {
             print(error)
         }

         let utterance = AVSpeechUtterance(string: read)
         utterance.voice = AVSpeechSynthesisVoice(language: language)
         utterance.rate = 0.5
         AVSpeechSynthesizer().speak(utterance)
     }

 }
