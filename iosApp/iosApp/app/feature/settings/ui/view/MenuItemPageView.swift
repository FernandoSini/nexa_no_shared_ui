//
// Created by Fernando Fazio Sinigaglia on 09/10/25.
//

import Foundation
import SwiftUI
import Shared

struct MenuItemPageView: View {

    @Binding var path: NavigationPath
    @State var pageType: PageType

    init(path: Binding<NavigationPath>, pageType: PageType = .account) {
        self._path = path
        self.pageType = pageType

    }


    var body: some View {
        EmptyView()
    }
}

enum PageType: Hashable {
    case contents
    case account
    case monetization
    case billing
    case support
    case notifications
    case privacy
    case terms
    case partnership

}