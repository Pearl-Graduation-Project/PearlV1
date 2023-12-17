//
//  TextBox.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 17/12/2023.
//

import SwiftUI

struct TextBox: View {
    // MARK: - Properties
    var placeholder: String
    @Binding var text: String

    // MARK: - Body
    var body: some View {
        RoundedRectangle(cornerRadius: 100)
            .stroke(Color.lavander, lineWidth: 1)
                   .frame(maxWidth: .infinity,maxHeight: 48)
                   .overlay(
                       HStack {
                           if text.isEmpty {
                               Text(placeholder)
                                   .foregroundColor(.gray)
                                   .padding(.leading, 16)
                           }
                           TextField("", text: $text)
                               .padding(.leading, 16)
                               .font(.body)
                               .foregroundColor(.primary)
                               .accentColor(.primary)
                               .frame(height: 48)
                       }
                   )
                //   .padding(.horizontal, 16)
    }
}

// MARK: - Preview
#Preview {
        TextBox(placeholder: "Username", text: .constant(""))
            .padding()
            .previewLayout(.sizeThatFits)
}
