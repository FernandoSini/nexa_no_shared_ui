//
// Created by Fernando Fazio Sinigaglia on 09/10/25.
//

import Foundation
import SwiftUI
import Shared

struct MenuItemPageView: View {

    @Binding var path: NavigationPath
    @ObservedObject private var routeViewModel = RouteViewModel()
    var pageType: PageType?

    init(path: Binding<NavigationPath>, pageType: PageType? = nil) {
        self._path = path
        self.pageType = pageType

    }


    var body: some View {
        if let pageType = self.pageType {
            routeViewModel.renderPageByType(pageType: pageType, path: $path)
        } else {
            EmptyView()
        }
    }

}



