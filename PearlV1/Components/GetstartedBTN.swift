//
//  GetstartedBTN.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 10/12/2023.
//

import SwiftUI

struct GetstartedBTN: View {
        var body: some View {
            HStack {
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.white)
                    .frame(width: 168, height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .overlay(
                        HStack {
                            Text("Get Started")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 24)) // Adjust the size as needed
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    )
            }
        }
    }

    #Preview {
        GetstartedBTN()
    }
