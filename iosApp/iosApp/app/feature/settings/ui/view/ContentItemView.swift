//
// Created by Fernando Fazio Sinigaglia on 13/10/25.
//

import Foundation
import SwiftUI


struct ContentItemView: View {
    @Binding var path: NavigationPath

    var body: some View {
        List {
            Section {
                Button {
                } label: {
                    HStack {
                        Text("Feed type")
                        Spacer()
                        Text("Timeline").foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 20)
                Button {
                } label: {
                    HStack {
                        Text("Comments")
                        Spacer()
                        Text("Restricted")// aqui vamos colocar open, restricted, members
                    }
                }
                .padding(.horizontal, 20)
            }
            .listRowInsets(EdgeInsets())
            .alignmentGuide(.listRowSeparatorLeading) { d in
                return -d.width * 0
            }
            MenuItemView(menuItem: MenuItem(menuTitle: "Preferences", menuDescription: "manage your content preferences", menuIcon: "magnifyingglass", menuAction: {}), path: $path)
        }
        .background(Color(hex: 0xff151218))
        .scrollContentBackground(.hidden)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbarTitleDisplayMode(.inlineLarge)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(NSLocalizedString("Content", comment: ""))
                    .font(.headline)
                    .fontWeight(.bold)
            }
        }
    }
}