//
//  LoginView.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 10/12/2023.
//
import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @StateObject private var forgotPasswordViewModel = ForgotPasswordViewModel()
    @State private var isForgotPasswordPresented = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 16) {
                Text("Sign In")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 64)
                
                Text("Sign In to your account to continue")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.bottom, 32)
                
                VStack(alignment: .leading,spacing: 8) {
                    Text("Email Address")
                        .font(.headline)
                        .foregroundColor(.primary)
                    TextBox(placeholder: "Email", text: $email)
                }
                
                VStack(alignment: .leading ,spacing: 8) {
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.primary)
                    PasswordBox(placeholder: "Password", text: $password)
                }
                
                HStack {
                    Spacer()
                    Button("Forgot Your Password?") {
                        isForgotPasswordPresented.toggle()
                    }
                    .foregroundColor(.black)
                    .padding(.top, 8)
                    .sheet(isPresented: $isForgotPasswordPresented) {
                        ForgotPasswordView(viewModel: forgotPasswordViewModel)
                    }
                }
                
                MainBTN(
                    action: {
                        // Handle sign-in action
                    },
                    buttonText: "Sign In",
                    buttonColor: .black,
                    textColor: .white
                )

                HStack {
                    Text("Don't have an account?")
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                            Text("Sign Up")
                                .font(.system(size: 18)) // Set the desired font size
                            
                                .underline()
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                        }
                    )}
                
                Text("Or continue with")
                    .foregroundColor(.gray)
                    .padding(.top, 16)
                
                // Add buttons for social media or other authentication methods here
                HStack(spacing: 16) {
                    SocialButton(imageName: "google", color: .red) {
                        // Handle Google sign-in action
                    }
                    
                    SocialButton(imageName: "facebook", color: .blue) {
                        // Handle Facebook sign-in action
                    }
                }
                
                Spacer()
            }
            .padding(16)
            .background(BackgroundGradient.combinedGradient)
            .navigationBarHidden(true) // Hide the navigation bar if you don't want it to be visible in this view

        }
    }
}

struct SignInButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
struct SocialButton: View {
    let imageName: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24) // Adjust the image size as needed
                .padding(12)
                .background(color)
                .cornerRadius(100)
        }
        .frame(width: 48, height: 48) // Overall button size
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(100)
    }
}

#Preview {
    SignInView()
}
