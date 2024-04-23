//
//  BookingAndSeatDetails.swift
//  flighty
//
//  Created by Christopher Free on 4/22/24.
//

import SwiftUI

struct BookingAndSeatDetails: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "ticket.fill")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button("Paste") { }
                        .tint(.blue)
                        .textCase(.uppercase)
                        .font(.caption2)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 10))
                }
                Text("Booking Code")
                    .fontWeight(.bold)
                Text("Tap to Edit")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.border, lineWidth: 1)
            }

            VStack(alignment: .leading) {
                Image(systemName: "carseat.right.fill")
                    // Ensures this HStack is the same height as the preceding.
                    .frame(maxHeight: .infinity)
                Text("Seat")
                    .fontWeight(.bold)
                    .frame(minWidth: 130, alignment: .leading)
                Text("Tap to Edit")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.border, lineWidth: 1)
            }
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    BookingAndSeatDetails()
}
