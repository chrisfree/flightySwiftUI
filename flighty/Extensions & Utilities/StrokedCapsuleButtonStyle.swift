//
//  StrokedCapsuleButtonStyle.swift
//  flighty
//
//  Created by Christopher Free on 4/22/24.
//

import SwiftUI

// A simple button style that adds a subtle border to otherwise plain styled buttons.
struct StrokedCapsule: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .foregroundStyle(.white)
            .background(
                Capsule()
                    .stroke(.tertiary, lineWidth: 1)
            )
    }
}
