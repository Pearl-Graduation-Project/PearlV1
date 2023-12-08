//
//  MainBTN.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 09/12/2023.
//

import SwiftUI

struct MainBTN: View {
    let action: () -> Void
    let buttonText: String
    let buttonColor: Color
    let textColor: Color

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .foregroundColor(textColor)
                .frame(width: 228, height: 38)
                .background(buttonColor)
                .cornerRadius(100)
        }
    }
}

#if DEBUG
#Preview {
        MainBTN(
            action: {
                // Your action here
            },
            buttonText: "Tap me",
            buttonColor: .black,
            textColor: .white
        )
        .previewLayout(.sizeThatFits)
    }
#endif
