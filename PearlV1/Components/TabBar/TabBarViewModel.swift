
import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Int = 0

    func updateSelectedTab(index: Int) {
        selectedTab = index
    }
}
