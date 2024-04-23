//
//  FlightDetails.swift
//  flighty
//
//  Created by Christopher Free on 4/22/24.
//

import SwiftUI

struct FlightDetails: View {
    @EnvironmentObject var uiModel: UIModel
    @State private var previousScrollOffset: CGFloat = 0
    @Binding var sheetPresented: Bool
    let minimumOffset: CGFloat = 5

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                // Scrolling horizontal sub-actions.
                Section {
                    HorizontalActions()

                    GateDepartureBanner()

                    DepartureAndArrivalDetails()

                    BookingAndSeatDetails()

                    GoodToKnowSection()
                        
                    ArrivalForecast()
                } header: {
                    flightDetailsHeader
                }
            }
            .background(
                GeometryReader { proxy in
                    Color.clear.preference(key: ViewOffsetKey.self, value: -proxy.frame(in: .named("container")).origin.y)
            })
            .onPreferenceChange(ViewOffsetKey.self) { currentOffset in
                let offsetDifference: CGFloat = self.previousScrollOffset - currentOffset
                if (abs(offsetDifference) > minimumOffset) {
                    self.previousScrollOffset = currentOffset
                }
            }
        }
        .scrollIndicators(.hidden)
        .coordinateSpace(name: "container")
    }

    fileprivate var flightDetailsHeader: some View {
        ZStack {
            HStack(spacing: 15) {
                Image("united-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(.white)
                    .frame(width: 40)
                VStack(alignment: .leading) {
                    HStack {
                        Text("DL 2534 • Fri, 12")
                            .foregroundStyle(.secondary)
                            .font(.caption.weight(.medium))
                            .textCase(.uppercase)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Text("Atlanta to Chicago")
                        .font(.title2.weight(.semibold))
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 5)
            }
            Button {
                uiModel.selectedDetent = .height(200)
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .symbolRenderingMode(.hierarchical)
                    .font(.title)
                    .opacity(0.5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(x: 5, y: -15)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.top, 17)
        .padding(.bottom, 10)
        .background(Rectangle().fill(.background))
        .overlay(
            Rectangle()
                .frame(width: nil, height: 0.5, alignment: .top)
                .foregroundColor(.lightGrey.opacity((previousScrollOffset - minimumOffset) / Double(10))),
        alignment: .bottom)
    }
}

#Preview {
    FlightDetails(sheetPresented: .constant(true))
}
