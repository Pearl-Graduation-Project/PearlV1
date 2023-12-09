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
                    Spacer()
                    Splash(page: pages[index])
                    Spacer()
                    if index == pages.indices.last {
                        Button(action: goToZero) {
                            Text("Sign Up")
                        }
                        .buttonStyle(.bordered)
                    } else {
                        Button(action: { incrementPage(index: index) }) {
                            Text("Next")
                        }
                    }
                    Spacer()
                }
                .tag(index)
            }
        }
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

    func goToZero() {
        pageIndex = 0
    }
}

#Preview {
    ContentView()
}
