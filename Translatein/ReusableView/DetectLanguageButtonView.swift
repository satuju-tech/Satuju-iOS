import SwiftUI

struct DetectLanguageButtonView: View {

    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Label(
                title: {},
                icon: { Image("micIcon")
                        .resizable()
                        .frame(width: 27, height: 41, alignment: .center)
                        .foregroundColor(.white)
                        .frame(width: 66, height: 66, alignment: .center)
                        .background(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color("AquaSecondary"), Color("PurplePrimary")]
                                ),
                                startPoint: .top, endPoint: .bottom
                            )
                        )
                        .clipShape(Circle())
                }
            )
        }
    }
}

struct DetectLanguageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DetectLanguageButtonView(action: {})
            .previewLayout(.fixed(width: 66, height: 66))
    }
}
