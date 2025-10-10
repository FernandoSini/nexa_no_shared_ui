//
// Created by Fernando Fazio Sinigaglia on 09/10/25.
//

import Foundation
import SwiftUI

extension NavigationPath {
    func toMenuItemPath(routePath: String, pageType: PageType) -> (String, PageType) {
        return (routePath, pageType)
    }


}

struct MyPath: Hashable {
    let routePath: String
    let pageType: PageType
}
