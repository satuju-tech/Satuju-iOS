import SwiftUI

struct MicButton: View {

    var action: () -> Void

    var color: Color

    var body: some View {
        Button {
            action()
        } label: {
            Image("micIcon")
                .resizable()
                .frame(width: 27, height: 41, alignment: .center)
                .foregroundColor(.white)
                .frame(width: 66, height: 66, alignment: .center)
                .background(
                    color
                )
                .clipShape(Circle())
        }
    }
}

struct DetectLanguageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MicButton(action: {}, color: Color("Aqua"))
            .previewLayout(.fixed(width: 66, height: 66))
    }
}
