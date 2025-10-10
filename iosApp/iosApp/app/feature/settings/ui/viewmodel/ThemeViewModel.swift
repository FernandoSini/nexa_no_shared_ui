//
// Created by Fernando Fazio Sinigaglia on 02/10/25.
//

import Foundation
import SwiftUI

class ThemeViewModel: ObservableObject {
    @Environment(\.colorScheme) private var defaultColorScheme
    @Published private(set) var colorScheme: ColorScheme = .dark
    @AppStorage("color_scheme") var colorSchemeSettings: String = "dark"


    init() {
        self.colorScheme = State<ColorScheme>(initialValue: self._colorSchemeSettings.wrappedValue == "dark" ? .dark : .light).wrappedValue
    }

    func changeColorScheme(new colorSchemeString: String) {
        colorSchemeSettings = colorSchemeString
        UserDefaults.standard.setValue(colorSchemeSettings, forKey: "color_scheme")
        changeColorSchemeEnvironment(new: colorSchemeSettings)
    }

    private func changeColorSchemeEnvironment(new colorSchemeString: String) {
        switch colorSchemeString {
        case "dark":
            colorScheme = .dark
        case "light":
            colorScheme = .light
        default:
            colorScheme = .light
        }

    }


}

