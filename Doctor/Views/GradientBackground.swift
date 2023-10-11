//
//  GradientBackground.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-08.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color.accentColor,
                            Color.white
                        ],
                        startPoint: .topTrailing,
                        endPoint: .bottom
                    )
                )
                .frame(width: 280)
                .opacity(0.4)
                .offset(x: -180, y: -80)
            
            LinearGradient(
                colors: [
                    Color.accentColor,
                    Color.accentColor.opacity(0.3)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
        }
        .clipShape(
            RoundedRectangle(cornerRadius: 25, style: .circular)
        )
        .frame(width: 300, height: 350)
        .padding(.top, 100)
    }
}

