//
// Created by Fernando Fazio Sinigaglia on 16/09/25.
//

import Foundation
import SwiftUI


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }

    func toUIColor() -> UIColor {
        let components = self.cgColor?.components
        let red = components?[0] ?? 0
        let green = components?[1] ?? 0
        let blue = components?[2] ?? 0
        let alpha = components?[3] ?? 1
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}
