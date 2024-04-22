//
//  ContentView.swift
//  flighty
//
//  Created by Christopher Free on 4/12/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var sheetPresented: Bool = true
    @State private var referenceOpacity = 0.0

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            Map {

            }.ignoresSafeArea()

            VStack(spacing: 10) {
                Image(systemName: "map.fill")
                Divider()
                    .frame(maxWidth: 30)
                Image(systemName: "cloud.fill")
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 12)
            .background(
                Capsule()
                    .fill(.thickMaterial)
            )
            .padding(.top, 70)
            .padding(.trailing, 20)
            .ignoresSafeArea()

            .sheet(isPresented: $sheetPresented) {
                FlightDetails()
                    //.presentationDetents([.height(200), .medium, .large])
                    .presentationDetents([.large])
                    .presentationDragIndicator(.hidden)
                    .interactiveDismissDisabled()
            }
            Image("reference")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(referenceOpacity)
                .onTapGesture {
                    referenceOpacity = 0.0
                }
        }
    }
}
struct FlightDetails: View {
    @State var previousScrollOffset: CGFloat = 0
    let minimumOffset: CGFloat = 5 // Optional

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                // Scrolling horizontal sub-actions.
                Section {
                    HorizontalActions()

                    GateDepartureBanner()

                    DepartureAndArrivalDetails()
                } header: {
                    ZStack {
                        HStack {
                            Image("united-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .background(.white)
                                .frame(width: 50)
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
                        Image(systemName: "xmark.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .font(.title)
                            .opacity(0.5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .offset(x: 5, y: -15)
                    }
                    .padding(.horizontal)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                    .background(Rectangle().fill(.background))
                    .overlay(
                        Rectangle()
                            .frame(width: nil, height: 0.5, alignment: .top)
                            .foregroundColor(.lightGrey.opacity((previousScrollOffset - minimumOffset) / Double(2.5))),
                    alignment: .bottom)
                }
            }
            /// https://stackoverflow.com/questions/59342384/how-to-detect-scroll-direction-programmatically-in-swiftui-scrollview
            .background(
                GeometryReader { proxy in
                    Color.clear.preference(key: ViewOffsetKey.self, value: -proxy.frame(in: .named("container")).origin.y)
            }).onPreferenceChange(ViewOffsetKey.self) { currentOffset in
                let offsetDifference: CGFloat = self.previousScrollOffset - currentOffset
                if (abs(offsetDifference) > minimumOffset) {
                    if offsetDifference > 0 {
                        // print("Is scrolling up toward top.")
                    } else {
                        // print("Is scrolling down toward bottom.")
                    }
                    self.previousScrollOffset = currentOffset
                }
            }
        }
        .coordinateSpace(name: "container")
    }
}



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

#Preview {
    ContentView()
}

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

            .font(.system(size: 14))
        }
        .contentMargins(.leading, 15)
        .scrollClipDisabled()
        .scrollIndicators(.hidden)

    }
}

struct GateDepartureBanner: View {
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



struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
