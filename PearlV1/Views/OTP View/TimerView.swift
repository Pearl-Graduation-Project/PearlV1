//
//  TimerView.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 19/12/2023.
//

// TimerView.swift

import SwiftUI

struct TimerView: View {
    @Binding var timeRemaining: TimeInterval

    var body: some View {
        Text("\(Int(timeRemaining))")
            .padding()
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
    }
}


#Preview {
    TimerView(timeRemaining: .constant(60.0)) // Use any initial time remaining value you prefer
}
