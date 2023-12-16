//
//  Navbar.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 15/12/2023.
//
import SwiftUI

struct NavigationElement<Destination: View>: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let destination: Destination
}

struct Navbar: View {
    let navigationElements: [NavigationElement<Text>] = [
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
                        NavbarElementView(element: element)
                        Spacer()
                    }
                }
                .padding()
                .frame(width: Constants.navbarWidth, height: Constants.navbarHeight)
                .background(Constants.navbarBackgroundColor)
                .cornerRadius(Constants.navbarCornerRadius)
            }
        }
    }
}

struct NavbarElementView<Destination: View>: View {
    let element: NavigationElement<Destination>

    var body: some View {
        NavigationLink(destination: element.destination) {
            VStack {
                Image(element.imageName)
                    .resizable()
                    .frame(width: Constants.elementImageSize, height: Constants.elementImageSize)
                Text(element.title).customTextStyle()
            }
        }
    }
}

extension View {
    func customTextStyle() -> some View {
        self
            .font(
                Font.custom("Roboto", size: Constants.customTextSize)
                    .weight(.bold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity,alignment: .center)
    }
}

struct Constants {
    static let navbarWidth: CGFloat = 350
    static let navbarHeight: CGFloat = 77
    static let navbarCornerRadius: CGFloat = 30
    static let navbarBackgroundColor = Color(#colorLiteral(red: 0.7803921699523926, green: 0.7058823704719543, blue: 1, alpha: 0.2))

    static let elementImageSize: CGFloat = 30
    static let customTextSize: CGFloat = 10
    static let customTextMinHeight: CGFloat = 12
    static let customTextMaxHeight: CGFloat = 12
}

#Preview{
        Navbar()
}

