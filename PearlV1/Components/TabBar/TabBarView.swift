//
//  TabBarView.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 06/01/2024.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var viewModel: TabBarViewModel

    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 0) {
                    ForEach(0..<5) { index in
                        VStack {
                            TabBarItemView(index: index, selectedTab: $viewModel.selectedTab)
                            if viewModel.selectedTab == index {
                                Image("TopRectangle")
                                    .resizable()
                                    .frame(width: 26, height: 5)
                                    .offset(y: -Constants.navbarHeight / 2)
                                    .padding(.top, -Constants.navbarHeight / 2)
                            }
                        }
                        .frame(height: Constants.navbarHeight)
                        Spacer()
                    }
                }
            }
            .padding()
            .background(Constants.navbarBackgroundColor)
            .cornerRadius(Constants.navbarCornerRadius)
        }
    }
}

#Preview {
    let viewModel = TabBarViewModel()
            return TabBarView(viewModel: viewModel)
        }
