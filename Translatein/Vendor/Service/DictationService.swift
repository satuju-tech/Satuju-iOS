//
//  DictationService.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 06/11/21.
//

import Foundation
import AVFoundation
import Speech
import SwiftUI

struct DictationService {

    private class SpeechAssist {

        var audioEngine: AVAudioEngine?
        var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
        var recognitionTask: SFSpeechRecognitionTask?
        var speechRecognizer = SFSpeechRecognizer()
        var locale: String = "en" {
            didSet {
                speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: locale))
            }
        }

        deinit {
            reset()
        }

        func reset () {
            recognitionTask?.cancel()
            audioEngine?.stop()
            audioEngine = nil
            recognitionRequest = nil
            recognitionTask = nil
        }

    }

    private let assistant = SpeechAssist()

    func changeLocale(locale: String) {
        assistant.locale = locale
    }

    func record(to speech: Binding<String>) {
        canAccess { authorized in
            guard authorized else {
                return
            }

            assistant.audioEngine = AVAudioEngine()
            guard let audioEngine = assistant.audioEngine else {
                fatalError("Unable to create audio engine")
            }
            assistant.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            guard let recognitionRequest = assistant.recognitionRequest else {
                fatalError("Unable to create request")
            }
            recognitionRequest.shouldReportPartialResults = true

            do {
                let audioSession = AVAudioSession.sharedInstance()
                try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
                let inputNode = audioEngine.inputNode

                let recordingFormat = inputNode.outputFormat(forBus: 0)
                inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, _) in
                    recognitionRequest.append(buffer)
                }

                audioEngine.prepare()
                try audioEngine.start()
                assistant.recognitionTask = assistant.speechRecognizer?.recognitionTask(with: recognitionRequest) { (result, error) in
                    var isFinal = false
                    if let result = result {
                        relay(speech, message: result.bestTranscription.formattedString)
                        isFinal = result.isFinal
                    }

                    if error != nil || isFinal {
                        audioEngine.stop()
                        inputNode.removeTap(onBus: 0)
                        self.assistant.recognitionRequest = nil
                    }
                }
            } catch {
                print("Error transcibing audio: " + error.localizedDescription)
                assistant.reset()
            }
        }
    }

    func stopRecording() {
        assistant.reset()
    }

    func canAccess(withHandler handler: @escaping (Bool) -> Void) {
        SFSpeechRecognizer.requestAuthorization { status in
            if status == .authorized {
                AVAudioSession.sharedInstance().requestRecordPermission { authorized in
                    handler(authorized)
                }
            } else {
                handler(false)
            }
        }
    }

    private func relay(_ binding: Binding<String>, message: String) {
        DispatchQueue.main.async {
            binding.wrappedValue = message
        }
    }

}
