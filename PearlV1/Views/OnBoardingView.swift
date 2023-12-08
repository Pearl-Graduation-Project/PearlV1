//
//  onBoardingView.swift
//  Pearl
//
//  Created by ElAmir Mansour on 07/12/2023.
//

import SwiftUI

//test
struct OnBoardingView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing:20){
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

                Text(page.description)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }

        }
        .frame(width: 300)
        .padding([.leading, .trailing])

    }
}

#Preview {
    OnBoardingView(page: Page.samplePage)
}
