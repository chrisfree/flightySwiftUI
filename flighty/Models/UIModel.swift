//
//  UIModel.swift
//  flighty
//
//  Created by Christopher Free on 4/22/24.
//

import SwiftUI

// Simple model for synchronizing the state of the UI across the app.
class UIModel: ObservableObject {
    @Published var selectedDetent: PresentationDetent = .height(200)
}
