//
//  PopupView.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 19/12/2023.
//

import SwiftUI

struct PopupView: View {
    @Binding var isPopupPresented: Bool

    var body: some View {
        ZStack {
            Color.white
                .frame(width: 279, height: 386)
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5) // Shadow added

                .scaleEffect(isPopupPresented ? 1.0 : 0.5) // Initial scale factor
                .opacity(isPopupPresented ? 1.0 : 0.0) // Initial opacity
                .animation(.easeInOut(duration: 0.5), value: isPopupPresented) // Ease-in-out animation

            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 110, height: 122)
                    .background(Color(red: 0.69, green: 0.33, blue: 0.88).opacity(0))
                    .background(
                        Image("donebubble")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )

                Text("Password Updated\nSuccessfully!")
                    .font(
                        Font.custom("Roboto", size: 24)
                            .weight(.heavy)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)

                Text("Your password has been updated\nsuccessfully")
                    .font(Font.custom("Roboto", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 258, alignment: .top)

                Button("Continue") {
                    // Handle the action for continuing
                    withAnimation {
                        isPopupPresented.toggle() // Dismiss the pop-up with animation
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

#Preview {
    PopupView(isPopupPresented: .constant(true))
}
