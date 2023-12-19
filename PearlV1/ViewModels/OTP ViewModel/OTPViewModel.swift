//
//  OTPViewModel.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 19/12/2023.
//

import SwiftUI
import Combine

class OTPViewModel: ObservableObject {
    @Published var enteredOTP: [String] = Array(repeating: "", count: 6)
    @Published var timeRemaining: TimeInterval = 120
    @Published var isResendButtonDisabled = false
    @Published var maskedPhoneNumber: String = "+20102********"
    @Published var errorMessage: String?

    private var timer: Timer?

    init() {
        startTimer()
    }

    func submitOTP() {
        // Implement logic to submit and verify OTP
        // Check enteredOTP, validate against the actual OTP, etc.
        // If successful, handle accordingly
        // If failed, set an error message
    }

    func resendOTP() {
        // Implement logic to resend OTP
        // This could involve calling a service to send a new OTP to the user's phone
        // Update UI accordingly
        startTimer()
        isResendButtonDisabled = true
    }

    private func startTimer() {
        timer?.invalidate()
        timeRemaining = 120
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                self.isResendButtonDisabled = false
            }
        }
    }

    deinit {
        timer?.invalidate()
    }
}

