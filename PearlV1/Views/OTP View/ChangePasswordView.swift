//
//  ChangePasswordView.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 19/12/2023.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var errorMessage: String?
    @State private var isPopupPresented = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Change Password")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 128)
            
            Text("Enter a new password to continue")
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding(.bottom, 64)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("New Password")
                    .font(.headline)
                    .foregroundColor(.primary)
                PasswordBox(placeholder: "Enter your new password", text: $newPassword)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Confirm Password")
                    .font(.headline)
                    .foregroundColor(.primary)
                PasswordBox(placeholder: "Confirm your new password", text: $confirmPassword)
            }
            .padding(.bottom, 32)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.bottom, 16)
            }
            
            MainBTN(
                action: {
                    // Validate passwords before proceeding
                    if newPassword == confirmPassword {
                        // Passwords match, proceed with the change password logic
                        errorMessage = nil
                        isPopupPresented.toggle() // Toggle the visibility of the popup
                        // Handle change password action
                    } else {
                        // Passwords don't match, show an error message
                        errorMessage = "Passwords do not match. Please enter matching passwords."
                    }
                },
                buttonText: "Change",
                buttonColor: .black,
                textColor: .white
            )
            
            Spacer()
        }
        .padding(16)
        .background(BackgroundGradient.combinedGradient)
        .overlay(
            ZStack {
                if isPopupPresented {
                    PopupView(
                        isPopupPresented: $isPopupPresented,
                        title: "Password Updated Successfully!",
                        message: "Your password has been updated successfully",
                        imageName: "donebubble",
                        buttonText: "Continue",
                        buttonAction: {
                            // Handle the action for continuing
                        }
                    )
                    .frame(width: 279, height: 386)
                    .background(Color.white)
                    .cornerRadius(25)
                    .zIndex(1)
                }
            }
        )
    }
}

#Preview {
    ChangePasswordView()
}
