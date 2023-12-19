//
//  ForgotPasswordViewModel.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 19/12/2023.
//

import SwiftUI
import Combine

class ForgotPasswordViewModel: ObservableObject {
    @Published var recoveryMethod: RecoveryMethod = .email
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var resetPasswordResult: Result<Void, Error>? = nil
    @Published var errorMessage: String?

    func resetPassword() {
        // Validate email or mobile number before attempting to reset the password
        guard validateInput() else {
            // Input is not valid, set an error message
            errorMessage = "Please enter a valid \(recoveryMethod == .email ? "email" : "mobile number")."
            return
        }

        // Reset error message
        errorMessage = nil

        // Implement the logic to send a password reset
        // email or SMS based on the selected recovery method
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.resetPasswordResult = .success(())
        }
    }

    private func validateInput() -> Bool {
        switch recoveryMethod {
        case .email:
            return isValidEmail(email)
        case .phoneNumber:
            return isValidPhoneNumber(phoneNumber)
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    private func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        // For simplicity, this example assumes a valid phone number is non-empty and contains only digits
        let phoneRegex = #"^\d+$"#
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phoneNumber)
    }
}


