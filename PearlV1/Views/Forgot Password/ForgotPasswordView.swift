//
//  ForgotPasswordView.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 19/12/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var viewModel: ForgotPasswordViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Forgot Password")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 128)

            Text("Enter your \(viewModel.recoveryMethod == .email ? "email" : "mobile number") to send you an OTP")
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding(.bottom, 32)

            VStack(alignment: .leading, spacing: 8) {
                Text("\(viewModel.recoveryMethod == .email ? "Email" : "Mobile Number") Address")
                    .font(.headline)
                    .foregroundColor(.primary)

                if viewModel.recoveryMethod == .email {
                    TextBox(placeholder: "Email", text: $viewModel.email)
                } else {
                    TextBox(placeholder: "Mobile Number", text: $viewModel.phoneNumber)
                }
            }

            Text("We will send you an OTP code to your \(viewModel.recoveryMethod == .email ? "email" : "mobile number"), then you can be able to change your password.")
                .foregroundColor(.gray)
                .font(.footnote)
                .padding(.bottom, 16)

            HStack {
                Text("Don’t have access to this?")
                    .foregroundColor(.black)

                Button("Try with \(viewModel.recoveryMethod == .email ? "mobile number" : "email")") {
                    // Handle the action to switch between email and mobile number
                    viewModel.recoveryMethod = (viewModel.recoveryMethod == .email) ? .phoneNumber : .email
                }
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            }
            .font(.system(size: 11, weight: .semibold))

            MainBTN(
                action: {
                    viewModel.resetPassword()
                },
                buttonText: "Send",
                buttonColor: .black,
                textColor: .white
            )

            Spacer()
        }
        .padding(16)
        .background(BackgroundGradient.combinedGradient)
    }
}

#Preview {
    
    let viewModel = ForgotPasswordViewModel()
    
    // Initialize ForgotPasswordView with the viewModel
    return ForgotPasswordView(viewModel: viewModel)
}
