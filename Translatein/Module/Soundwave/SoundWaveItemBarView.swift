//
//  SoundWaveItemBarView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 04/11/21.
//

import SwiftUI

struct SoundWaveItemBarView: View {

    var value: CGFloat
    var numberOfSamples: Int

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.orange, .purple, .blue]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 4, height: value)
    }

}

struct SoundWaveItemBarView_Previews: PreviewProvider {
    static var previews: some View {
        SoundWaveItemBarView(
            value: 20, numberOfSamples: 18
        )
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
