//
//  SoundWaveView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 04/11/21.
//

import SwiftUI

var numberOfBar: Int = 36
var leftGradientColor: Color = Color(red: 255 / 255, green: 71 / 255, blue: 23 / 255)
var centerGradientColor: Color = Color(red: 158 / 255, green: 13 / 255, blue: 168 / 255)
var rightGradientColor: Color = Color(red: 20 / 255, green: 145 / 255, blue: 156 / 255)

struct SoundWaveView: View {
    @ObservedObject private var mic = SoundWaveInputVoice(numberOfSamples: numberOfBar)
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [leftGradientColor, centerGradientColor, rightGradientColor]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(minWidth: 267, maxHeight: 70)
                    .mask(
                        HStack(spacing: 4) {
                            ForEach(mic.soundSamples, id: \.self) { level in
                                SoundWaveItemBarView(value: self.normalizeSoundLevel(level: level), numberOfSamples: numberOfBar)
                            }
                        }
                    )
            }
        }

    }

    private func normalizeSoundLevel(level: Float) -> CGFloat {
        let level = max(10, CGFloat(level) + 25) / 2
        return CGFloat(level * (100 / 30))
    }
}

struct SoundWaveView_Previews: PreviewProvider {
    static var previews: some View {
        SoundWaveView(action: {
        })
            .previewLayout(.sizeThatFits)
    }
}
