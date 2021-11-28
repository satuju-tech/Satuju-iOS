import SwiftUI

struct MicButton: View {

    @State private var isRecording = false

    var action: () -> Void

    var color: Color

    var body: some View {
        Button {
            action()
            isRecording.toggle()
        } label: {
            ZStack {
                ZStack {
                    Circle()
                        .frame(width: 66, height: 66)
                        .foregroundColor(color.opacity(0.3))
                        .scaleEffect(isRecording ? 1.3 : 0)
                        .opacity(isRecording ? 1 : 0)
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(color.opacity(0.1))
                        .scaleEffect(isRecording ? 1.5 : 0)
                        .opacity(isRecording ? 1 : 0)
                }
                .animation(isRecording ? Animation.linear(duration: 1.5).repeatForever(autoreverses: true) : nil)
                Circle()
                    .frame(width: 66, height: 66)
                    .foregroundColor(color)
                Image(isRecording ? "stopIcon" : "micIcon")
            }
        }
    }
}

struct DetectLanguageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MicButton(action: {}, color: Color("Aqua"))
            .previewLayout(.fixed(width: 66, height: 66))
    }
}
