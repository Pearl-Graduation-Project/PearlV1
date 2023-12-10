//
//  GFNextButton.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 10/12/2023.
//

import SwiftUI

struct GFNextButton: View {
    var buttonAction: () -> Void
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Circle()
                .fill(Color.blackC)
                .overlay {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.white)
                }
                .frame(width: 36, height: 36)
        }
    }
}

#Preview {
    GFNextButton(buttonAction: {})
}
