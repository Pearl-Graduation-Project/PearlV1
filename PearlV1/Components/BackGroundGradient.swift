//
//  BackGroundGradient.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 17/12/2023.
//

import Foundation
import SwiftUI

struct BackgroundGradient {
    static let combinedGradient: some View = ZStack {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.lavander,
                .clear,
                .clear,
                Color.mint,
            ]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
        .blur(radius: 100)
    }
    
}
