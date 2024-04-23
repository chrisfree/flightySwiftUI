//
//  ArrivalForecast.swift
//  flighty
//
//  Created by Christopher Free on 4/23/24.
//

import SwiftUI

struct ArrivalForecast: View {

    var body: some View {
        // Arrival forecast.
        VStack(alignment: .leading, spacing: 7) {
            VStack(alignment: .leading) {
                Text("Arrival Forecast")
                    .font(.title2.weight(.semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("UA 2534 performance over the last 60 days")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 5)

            HStack {
                // Late percentage.
                VStack(alignment: .leading, spacing: 4) {
                    Text("Late")
                        .font(.system(size: 14).weight(.medium))
                        .foregroundStyle(.secondary)
                    HStack(spacing: 3.5) {
                        Image(systemName: "clock")
                            .fontWeight(.semibold)
                        Text("27%")
                            .font(.system(size: 15))
                    }
                }
                Spacer()
                // Average of Late timing.
                VStack(alignment: .leading, spacing: 4) {
                    Text("Average of Late")
                        .font(.system(size: 14).weight(.medium))
                        .foregroundStyle(.secondary)
                    HStack(spacing: 3.5) {
                        Image(systemName: "stopwatch.fill")
                            .fontWeight(.semibold)
                        Text("12m")
                            .font(.system(size: 15))
                    }
                }
                Spacer()
                // Late percentage.
                VStack(alignment: .leading, spacing: 4) {
                    Text("Observed")
                        .font(.system(size: 14).weight(.medium))
                        .foregroundStyle(.secondary)
                    HStack(spacing: 3.5) {
                        Image(systemName: "airplane.circle")
                            .fontWeight(.semibold)
                        Text("11")
                            .font(.system(size: 15))
                    }
                }
            }
            .padding(.top, 7)
            .padding(.horizontal, 5)

            Grid(alignment: .leading) {
                ForEach(ArrivalData.generateSampleData()) { arrivalData in
                    GridRow {
                        Text("\(arrivalData.name)")
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(.tertiary.opacity(0.35))

                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(arrivalData.arrivalStatusColor)
                                    .frame(width: geometry.size.width * arrivalData.value)
                            }
                        }
                        Text("\(arrivalData.value.formatted(.percent.precision(.fractionLength(0))))")
                            .gridColumnAlignment(.trailing)
                    }
                }
            }
            .font(.footnote)
            .padding(.top, 20)

        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.border, lineWidth: 1)
        )
        .padding(.horizontal, 15)
    }
}

struct ArrivalData: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
    let arrivalStatusColor: Color

    static func generateSampleData() -> [ArrivalData] {
        var sampleData = [ArrivalData]()
        for status in FlightStatus.allCases {
            sampleData.append(ArrivalData(name: status.description, value: Double.random(in: 0.0...0.4), arrivalStatusColor: status.color))
        }
        return sampleData
    }
}

enum FlightStatus: CaseIterable {
    case early
    case onTime
    case fifteenMinLate
    case thirtyMinLate
    case fortyFiveMinLate
    case cancelled
    case diverted

    var description: String {
        switch self {
        case .early: return "Early"
        case .onTime: return "On Time"
        case .fifteenMinLate: return "15m late"
        case .thirtyMinLate: return "30m late"
        case .fortyFiveMinLate: return "45m+ late"
        case .cancelled: return "Canceled"
        case .diverted: return "Diverted"
        }
    }

    var color: Color {
        switch self {
        case .early: return .green
        case .onTime: return .green.opacity(0.80)
        case .fifteenMinLate: return .yellow
        case .thirtyMinLate: return .orange
        case .fortyFiveMinLate: return .red
        case .cancelled: return .red
        case .diverted: return .gray
        }
    }
}

#Preview {
    ArrivalForecast()
}
