//
//  ContentView.swift
//  Pearl
//
//  Created by ElAmir Mansour on 06/12/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()

    var body: some View {
        // testing
        TabView(selection: $pageIndex) {
            ForEach(pages.indices, id: \.self) { index in
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: 0xDACBFF), Color(hex: 0xECE4FF)]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .edgesIgnoringSafeArea(.all)

                    VStack {
                        Spacer()
                        OnBoardingView(page: pages[index])
                        Spacer()

                            MainBTN(
                                action: { incrementPage(index: index) },
                                buttonText: "Next",
                                buttonColor: .black,
                                textColor: .white
                            )
                        .padding(.top, 20)

                        Spacer()
                    }
                    .tag(index)
                }
            }
        }
        .ignoresSafeArea()
        .animation(.easeInOut(duration: TimeInterval(pageIndex)), value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }

    func incrementPage(index: Int) {
        pageIndex = index + 1
    }

}

#Preview {
    ContentView()
}
