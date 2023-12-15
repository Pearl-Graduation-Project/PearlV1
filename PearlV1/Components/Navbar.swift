//
//  Navbar.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 15/12/2023.
//
import SwiftUI

struct NavigationElement: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let destination: Text
}

struct Navbar: View {
    let navigationElements: [NavigationElement] = [
        NavigationElement(title: "Home", imageName: "HomeNotClicked", destination: Text("Element 1 Details")),
        NavigationElement(title: "Progress", imageName: "ProgressSF", destination: Text("Element 2 Details")),
        NavigationElement(title: "Products", imageName: "ProdcutsIconSF", destination: Text("Element 3 Details")),
        NavigationElement(title: "Routine", imageName: "RoutineIconSF", destination: Text("Element 4 Details")),
        NavigationElement(title: "Community", imageName: "CommunitySF", destination: Text("Element 5 Details")),
    ]

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(navigationElements) { element in
                        Spacer()
                        NavigationLink(destination: element.destination) {
                            VStack {
                                Image(element.imageName)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text(element.title).customTextStyle()
                            }
                        }
                        Spacer()
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

#Preview {
        Navbar()
}
