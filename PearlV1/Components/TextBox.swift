import SwiftUI

struct TextBox: View {
    // MARK: - Properties
    var placeholder: String
    @Binding var text: String

    // MARK: - Body
    var body: some View {
        RoundedRectangle(cornerRadius: 100)
            .stroke(Color.lavander, lineWidth: 1)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .overlay(
                ZStack {
                    HStack {
                        if text.isEmpty {
                            Text(placeholder)
                                .foregroundColor(.gray)
                                .padding(.leading, 16)
                        }
                        Spacer()
                    }
                    TextField("", text: $text)
                        .padding(.leading, 16)
                        .font(.body)
                        .foregroundColor(.primary)
                        .accentColor(.primary)
                        .frame(height: 48)
                }
            )
    }
}

// MARK: - Preview
#Preview {
        TextBox(placeholder: "Username user name", text: .constant(""))
            .padding()
            .previewLayout(.sizeThatFits)
}
