import SwiftUI

struct InitialView: View {
    @State private var logoVisible = true
    @State private var showContentView = false
    @State private var logoSize: CGSize = CGSize(width: 200, height: 200)


    var body: some View {
        ZStack {
            if logoVisible {
                LogoView()
                    .scaleEffect(logoVisible ? 1.5 : 1.0)
                    .opacity(logoVisible ? 1.0 : 0.0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                
                                logoVisible = false
                                showContentView = true
                            }
                        }
                    }
            } else {
                if showContentView {
                    ContentView()
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 2.0), value:logoSize)
                }
            }
        }
        .ignoresSafeArea()
    }
}




struct LogoView: View {
    var body: some View {
        Image("Logo")
            .foregroundColor(.white)
            .font(.largeTitle)
    }
}

#if DEBUG
#Preview{
        InitialView()
    }
#endif
extension CGSize: Equatable {
    public static func == (lhs: CGSize, rhs: CGSize) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}

