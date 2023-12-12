import SwiftUI
struct OnBoardingView: View {
    var page: Page
    var isLastPage: Bool

    var action: () -> Void

    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: page.tag == 2 ? 0x245281 : 0xDACBFF),
                    Color(hex: page.tag == 2 ? 0x1E214E : 0xECE4FF)
                ]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                Image("\(page.imageUrl)")
                    .resizable()
                    .frame(width: 200, height: 300)
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .padding()
                    .cornerRadius(30)
                    .frame(width: 200)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(page.name)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(page.tag == 2 ? .white : .black)
                    
                    Text(page.description)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(page.tag == 2 ? .white : .black)
                }
                Spacer()
                
                HStack{
                    if isLastPage {
                        Spacer()
                        GetstartedBTN()
                            .onTapGesture {
                                action() // Trigger the action when the Get Started button is tapped
                            }
                            .padding(.top, 20)
                    } else {
                        Spacer()
                        MainBTN(
                            action: action,
                            buttonText: "Next",
                            buttonColor: .black,
                            textColor: .white
                        )
                        .padding(.top,20)
                    }
                }
                Spacer()
            }
            .frame(width: 300)
            .padding([.leading, .trailing])
        }
    }
}

#Preview {
    OnBoardingView(page: Page.samplePage, isLastPage: false, action: {})
}


extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
}
