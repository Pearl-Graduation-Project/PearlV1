//
//  Navbar.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 15/12/2023.
//

import SwiftUI
struct Navbar: View {
    var body: some View {
        NavigationView {
            VStack {
                // Your custom navigation bar with 5 elements
                HStack {
                    NavigationLink(destination: Text("Element 1 Details")) {
                        VStack {
                            Image("HomeNotClicked") // Replace with your image
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Home").customTextStyle()
                            
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: Text("Element 2 Details")) {
                        VStack {
                            Image("ProgressSF") // Replace with your image
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Progress").customTextStyle()
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: Text("Element 3 Details")) {
                        VStack {
                            Image("ProdcutsIconSF") // Replace with your image
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Products").customTextStyle()
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: Text("Element 4 Details")) {
                        VStack {
                            Image("RoutineIconSF") // Replace with your image
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Routine").customTextStyle()
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: Text("Element 5 Details")) {
                        VStack {
                            Image("CommunitySF") // Replace with your image
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Community").customTextStyle()
                        }
                    }
                }
                .padding()
                .frame(width: 350, height: 77)
                .background(Color(#colorLiteral(red: 0.7803921699523926, green: 0.7058823704719543, blue: 1, alpha: 0.2))) // Background color
                .cornerRadius(30)
                
            }
        }
    }
    }
#Preview {
    Navbar()
}
extension View {
    func customTextStyle() -> some View {
        self
            .font(
                Font.custom("Roboto", size: 10)
                    .weight(.bold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .center)
    }
}
