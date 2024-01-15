import SwiftUI
struct PopupView: View {
    @Binding var isPopupPresented: Bool
    var title: String
    var message: String
    var imageName: String
    var buttonText: String
    var buttonAction: () -> Void

    var body: some View {
        ZStack {
            Color.white
                .frame(width: 279, height: 386)
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                .scaleEffect(isPopupPresented ? 1.0 : 0.5)
                .opacity(isPopupPresented ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 0.5), value: isPopupPresented)

            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 110, height: 122)
                    .background(Color(red: 0.69, green: 0.33, blue: 0.88).opacity(0))
                    .background(
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )

                Text(title)
                    .font(
                        Font.custom("Roboto", size: 24)
                            .weight(.heavy)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)

                Text(message)
                    .font(Font.custom("Roboto", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 258, alignment: .top)

                Button(buttonText) {
                    withAnimation {
                        buttonAction() // Execute the dynamic action
                        isPopupPresented.toggle()
                    }
                }
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 38)
                .background(Color.black)
                .cornerRadius(8)
                .padding(.top, 16)
            }
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(
            isPopupPresented: .constant(true),
            title: "Password Updated Successfully!",
            message: "Your password has been updated successfully",
            imageName: "donebubble",
            buttonText: "Continue",
            buttonAction: {}
        )
    }
}
