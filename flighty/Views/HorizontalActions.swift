//
//  HorizontalActions.swift
//  flighty
//
//  Created by Christopher Free on 4/22/24.
//

import SwiftUI

// A view that renders all of the horizontally scrollable actions within the flight detail sheet.
struct HorizontalActions: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // Live Share button
                Button { } label: {
                    Label("Live Share", systemImage: "square.and.arrow.up")
                        .padding(.vertical, 2)
                        .padding(.horizontal, 5)
                }
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)

                // My flight.
                Button { } label: {
                    Label("My Flight", systemImage: "person.fill")
                }
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .tint(.white)
                .buttonStyle(StrokedCapsule())
                .buttonBorderShape(.capsule)

                // Alternatives button.
                Button { } label: {
                    Label("Alternatives", systemImage: "arrow.triangle.2.circlepath")
                }
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .tint(.white)
                .buttonStyle(StrokedCapsule())
                .buttonBorderShape(.capsule)

                // Live activity.
                Button { } label: {
                    Label("Live Activity", systemImage: "bolt.fill")
                }
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .tint(.white)
                .buttonStyle(StrokedCapsule())
                .buttonBorderShape(.capsule)

                Button { } label: {
                    Label("More", systemImage: "ellipsis")
                }
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .tint(.white)
                .buttonStyle(StrokedCapsule())
                .buttonBorderShape(.capsule)
            }
            .font(.system(size: 12))
        }
        .contentMargins(.leading, 15)
        .scrollClipDisabled()
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HorizontalActions()
}
