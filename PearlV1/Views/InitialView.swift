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
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(hex: 0xD6E4FF), location: 0.0),
                    .init(color: Color(hex: 0xE3FFE3), location: 0.3),
                    .init(color: Color(hex: 0xFFD4DE), location: 0.7),
                    .init(color: Color(hex: 0xFFF8F3), location: 1.0),
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 20)
            Image("Logo")
                .resizable()
                .frame(width: 92, height: 174)
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .frame(width: 200)
        }
    }
}


#if DEBUG
#Preview{
        InitialView()
    }
#endif
extension CGSize {
    public static func == (lhs: CGSize, rhs: CGSize) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}


