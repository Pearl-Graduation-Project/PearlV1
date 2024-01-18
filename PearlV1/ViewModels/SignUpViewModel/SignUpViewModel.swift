//
//  SignUpViewModel.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 15/01/2024.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var password = ""

    // Add other properties and methods for sign-up logic
}
