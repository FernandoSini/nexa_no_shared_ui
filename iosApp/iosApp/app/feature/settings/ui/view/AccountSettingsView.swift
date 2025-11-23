//
// Created by Fernando Fazio Sinigaglia on 13/10/25.
//

import Foundation
import SwiftUI

struct AccountSettingsView: View {
    @Binding var path: NavigationPath

    var body: some View {
        List {
            Section {
                Button {
                } label: {
                    HStack {
                        Text("Account Privacy")
                        Spacer()
                        Text("Public").font(.subheadline)
                            .foregroundColor(.gray)
                        // public, private, company
                    }
                }
            }

        }
        .scrollContentBackground(.hidden)
        .background(Color(hex: 0xff151218))
        .toolbarTitleDisplayMode(.inlineLarge)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Account")
                    .font(.headline)
                    .fontWeight(.bold)
            }
        }
    }
}
