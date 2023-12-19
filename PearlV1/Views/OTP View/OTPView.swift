//
//  OTPView.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 19/12/2023.
//

import SwiftUI

import SwiftUI

struct OTPView: View {
    @ObservedObject var viewModel: OTPViewModel
    @State private var timeRemaining: TimeInterval = 60 // Initial value for the timer

    var body: some View {
        VStack(spacing: 16) {
            Text("Forgot Password")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 128)

            Text("Enter OTP code we just sent you on your registered mobile number.")
                .foregroundColor(.gray)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
                .frame(width: 258, alignment: .top)


            OTPTextField(numberOfFields: 6, enterValue: $viewModel.enteredOTP)
                .padding(.bottom, 16)

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    // Display timer here
                    TimerView(timeRemaining: $viewModel.timeRemaining)
                        .font(Font.custom("Inter", size: 10))
                        .foregroundColor(.black)

                    // Display message about the sent code
                    Text("We sent you a 5-digit code to mobile number \(viewModel.maskedPhoneNumber). Check your inbox.")
                        .font(Font.custom("Roboto", size: 12))
                        .foregroundColor(.black)
                        .frame(width: 258, alignment: .top) // Adjusted frame width and alignment
                }

                Spacer()
            }
            .padding(.bottom, 16)

            HStack() {
                Text("Didn't receive code?")
                    .foregroundColor(.black)
                

                // Button to send the code again
                Button("Send again") {
                    viewModel.resendOTP()
                }
                .foregroundColor(.black)
            }
            .font(.system(size: 11, weight: .semibold))
            .padding(.bottom, 16)
            .frame(alignment: .leading)

            // Submit button
            MainBTN(
                action: {
                    viewModel.submitOTP()
                },
                buttonText: "Submit",
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
    let viewModel = OTPViewModel() // Initialize your OTPViewModel
    return OTPView(viewModel: viewModel)
}
