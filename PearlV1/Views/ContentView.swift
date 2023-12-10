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
                    VStack {
                        OnBoardingView(page: pages[index], isLastPage: pages[index].tag == 2, action: { incrementPage(index: index) })
                                    .tag(index)
                    }
                    .tag(index)
                }
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
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
