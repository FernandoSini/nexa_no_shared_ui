//
// Created by Fernando Fazio Sinigaglia on 30/09/25.
//

import Foundation
import SwiftUI

struct MenuItemView: View {

    @Binding var path: NavigationPath
    @State private var isTapped: Bool = false
    private var menuItem: MenuItem

    init(menuItem: MenuItem, path: Binding<NavigationPath>) {
        self.menuItem = menuItem
        self._path = path
    }

    var body: some View {
        Section {
            HStack {
                ZStack {
                    Color(hex: 0xff787878, alpha: 0.15)
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                    Image(systemName: menuItem.menuIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing, 10)
                VStack {
                    Text(NSLocalizedString(menuItem.menuTitle, comment: ""))
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(NSLocalizedString(menuItem.menuDescription, comment: ""))
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

            }
        }
        .background(isTapped ? Color.primary.opacity(0.2) : Color.clear)
        .animation(.easeInOut(duration: 0.15), value: isTapped)
        .cornerRadius(10)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
        .frame(maxWidth: .infinity, maxHeight: 60)
        .contentShape(Rectangle())
        .onTapGesture {
            isTapped = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isTapped = false
                if (menuItem.pageType != nil) {
                   path.append(MyPath(routePath: "internal-page", pageType: menuItem.pageType!))
                }
                if menuItem.menuTitle.lowercased().contains("logout") {
                    menuItem.menuAction = {

                        path.removeLast(path.count)
                        path.append("login")
                    }
                    menuItem.menuAction()
                }
            }

        }
        .onLongPressGesture(
            minimumDuration: 0.5,
            pressing: { isPressing in
                isTapped = isPressing
            },
            perform: {
                // Executa navegação apenas ao soltar o botão
                if menuItem.menuTitle.lowercased().contains("logout") {
                    menuItem.menuAction = {
                        path.removeLast(path.count)
                        path.append("login")
                    }
                    DispatchQueue.main.async {
                        menuItem.menuAction()
                    }
                }
            }
        )
    }

}