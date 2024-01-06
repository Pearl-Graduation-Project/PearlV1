//
//  TabBarItemView.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 06/01/2024.
//

import SwiftUI

struct TabBarItemView: View {
    let index: Int
    @Binding var selectedTab: Int

    var body: some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack {
                Image(selectedTab == index ? Constants.tabSelectedImages[index] : Constants.tabImages[index])
                    .resizable()
                    .frame(width: Constants.elementImageSize, height: Constants.elementImageSize)
                Text(Constants.tabTitles[index]).customTextStyle()
            }
        }
        .foregroundColor(selectedTab == index ? .blue : .black)
    }
}





#Preview {
    TabBarItemView(index: 0, selectedTab: .constant(0))
}

extension Text {
    func customTextStyle() -> some View {
        self
            .font(
                Font.custom("Roboto", size: Constants.customTextSize)
                    .weight(.bold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .fixedSize(horizontal: true, vertical: true)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
