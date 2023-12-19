import SwiftUI

struct PasswordBox: View {
    // MARK: - Properties
    var placeholder: String
    @Binding var text: String
    @State private var isPasswordVisible = false

    // MARK: - Body
    var body: some View {
        RoundedRectangle(cornerRadius: 100)
            .stroke(Color.lavander, lineWidth: 1)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .overlay(
                HStack {
                    if text.isEmpty {
                        TextField(placeholder, text: $text)
                            .padding(.leading, 16)
                            .font(.body)
                            .foregroundColor(.primary)
                            .accentColor(.primary)
                            .frame(height: 48)
                            .multilineTextAlignment(.leading)
                    } else {
                        if isPasswordVisible {
                            TextField("", text: $text)
                                .padding(.leading, 16)
                                .font(.body)
                                .foregroundColor(.primary)
                                .accentColor(.primary)
                                .frame(height: 48)
                                .multilineTextAlignment(.leading)
                        } else {
                            SecureField("", text: $text)
                                .padding(.leading, 16)
                                .font(.body)
                                .foregroundColor(.primary)
                                .accentColor(.primary)
                                .frame(height: 48)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .padding(.trailing, 16)
                    }
                }
            )
    }
}

// MARK: - Preview
#Preview {
    PasswordBox(placeholder: "Password new password", text: .constant(""))
        .padding()
        .previewLayout(.sizeThatFits)
}
