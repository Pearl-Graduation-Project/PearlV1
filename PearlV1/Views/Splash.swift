//
//  onBoardingView.swift
//  Pearl
//
//  Created by ElAmir Mansour on 07/12/2023.
//

import SwiftUI
// skin problems detection models
//test
struct Splash: View {
    var page: Page
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: 0xDACBFF), Color(hex: 0xECE4FF)]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:20) {
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
                        .foregroundColor(.blackC)

                    Text(page.description)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.blackC)
                }
            }
            .frame(width: 300)
            .padding([.leading, .trailing])
        }
    }
}

#Preview {
    Splash(page: Page.samplePage)
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

