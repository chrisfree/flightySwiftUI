//
//  GateDepartureBanner.swift
//  flighty
//
//  Created by Christopher Free on 4/22/24.
//

import SwiftUI

// The banner that displays the gate, relative departure time, and status.
struct GateDepartureBanner: View {
    // This should be stateful, with a property that indicates whether a flight
    // is on time, late, cancelled, etc.
    var body: some View {
        HStack {
            Text("Gate Departure in 1h 16m")
                .foregroundStyle(.green)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Label("B1A", systemImage: "figure.walk.circle.fill")
                .foregroundStyle(.black)
                .fontWeight(.semibold)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.yellow)
                )
        }
        .padding(.vertical, 13)
        .padding(.horizontal, 15)
        .background(
            Rectangle()
                .fill(.green.opacity(0.05))
        )
        .overlay(Rectangle().frame(width: nil, height: 0.25, alignment: .top).foregroundColor(.green.opacity(0.5)), alignment: .top)
        .overlay(Rectangle().frame(width: nil, height: 0.5, alignment: .top).foregroundColor(.green.opacity(0.5)), alignment: .bottom)
    }
}

#Preview {
    GateDepartureBanner()
}
