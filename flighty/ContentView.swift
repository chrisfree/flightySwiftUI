//
//  ContentView.swift
//  flighty
//
//  Created by Christopher Free on 4/12/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var uiModel = UIModel()
    @State private var selectedDetent: PresentationDetent = .medium
    @State private var sheetPresented: Bool = true
    @State private var referenceOpacity = 0.0

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            Map {

            }
            .ignoresSafeArea()

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
                FlightDetails(sheetPresented: $sheetPresented)
                    .presentationDetents([.height(200), .medium, .large], selection: $uiModel.selectedDetent)
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
        .background(
            Rectangle()
                .fill(.red)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        .environmentObject(uiModel)
    }
}

#Preview {
    ContentView()
}

// A simple preference key for bubbling up the scrollview's offset so that the
// header can dynamically set it's bottom border opacity as the user scrolls.
struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
