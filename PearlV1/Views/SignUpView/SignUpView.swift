// SignUpView.swift
import SwiftUI

struct SignUpView: View {
    @StateObject private var signUpViewModel = SignUpViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 16)
                
                Text("Create an account to get started")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.bottom, 32)
                
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("First Name")
                            .font(.headline)
                            .foregroundColor(.primary)
                        TextBox(placeholder: "First Name", text: $signUpViewModel.firstName)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Last Name")
                            .font(.headline)
                            .foregroundColor(.primary)
                        TextBox(placeholder: "Last Name", text: $signUpViewModel.lastName)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email Address")
                        .font(.headline)
                        .foregroundColor(.primary)
                    TextBox(placeholder: "Email", text: $signUpViewModel.email)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Phone Number")
                        .font(.headline)
                        .foregroundColor(.primary)
                    TextBox(placeholder: "Phone Number", text: $signUpViewModel.phoneNumber)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.primary)
                    TextBox(placeholder: "Password", text: $signUpViewModel.password)
                }
                
                MainBTN(
                    action: {
                        // Handle sign-up action
                    },
                    buttonText: "Sign Up",
                    buttonColor: .black,
                    textColor: .white
                )
                VStack {
                    HStack(alignment: .top, spacing: 0) {
                        Text("By continuing, you agree with Pearl's ")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: true, vertical: false) // Ensure the text stays on a single line
                        
                        Button(action: {
                            // Handle Terms and Conditions action
                        }) {
                            Text("Terms and Conditions")
                                .underline()
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .top, spacing: 0) {
                        Text(" and ")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            // Handle Privacy Policy action
                        }) {
                            Text("Privacy Policy")
                                .underline()
                                .font(.system(size: 10)) // Set the desired font size
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                
                
                HStack (alignment:.top ,spacing: 0){
                    Text("Already have an account?")
                        .font(.system(size: 10)) // Set the desired font size
                    
                        .foregroundColor(.black)
                    
                    NavigationLink(
                        destination: SignInView(),
                        label: {
                            Text("Sign in")
                                .font(.system(size: 11)) // Set the desired font size
                            
                                .underline()
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                        }
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Force the HStack to take up the full width
                
                Text("Or continue with")
                    .foregroundColor(.gray)
                    .padding(.top, 16)
                
                HStack(spacing: 16) {
                    SocialButton(imageName: "google", color: .red) {
                        // Handle Google sign-in action
                    }
                    
                    SocialButton(imageName: "facebook", color: .blue) {
                        // Handle Facebook sign-in action
                    }
                }
            }
            .padding(16)
            .background(BackgroundGradient.combinedGradient)
            .navigationBarHidden(true) // Hide the navigation bar if you don't want it to be visible in this view
            
        }
    }
}

#Preview {
    SignUpView()
}
