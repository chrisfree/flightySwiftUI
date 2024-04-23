//
//  GoodToKnowSection.swift
//  flighty
//
//  Created by Christopher Free on 4/22/24.
//

import SwiftUI

struct GoodToKnowSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            VStack(alignment: .leading) {
                Text("Good to Know")
                    .font(.title2.weight(.semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Information about this flight")
                    .font(.callout.weight(.semibold))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 5)

            HStack(spacing: 5) {
                Image(systemName: "clock")
                    .font(.title2)
                    .padding(.leading,5)
                    .padding(.trailing, 15)
                VStack(alignment: .leading, spacing:7) {
                    Text("No Timezone Change")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Both airports are in the same timezone")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 20)
                .overlay(
                    Rectangle()
                        .frame(width: nil, height: 0.5, alignment: .top)
                        .foregroundColor(.border)
                    , alignment: .bottom)
            }

            HStack(spacing: 5) {
                Image(systemName: "moon.fill")
                    .font(.title2)
                    .padding(.leading,5)
                    .padding(.trailing, 15)
                VStack(alignment: .leading, spacing:7) {
                    Text("Arrival Weather")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("57°F and clear sky")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 10)
            }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.border, lineWidth: 1)
        )
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}
#Preview {
    GoodToKnowSection()
}
