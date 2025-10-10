//
// Created by Fernando Fazio Sinigaglia on 29/09/25.
//

import Foundation
import SwiftUI

class MenuViewModel: ObservableObject {

    @Published var menuItems: [MenuItem]
    @Published var menuType: MenuType

    init(menuType: MenuType = .settingsMenu,
         menuItems: [MenuItem] = renderInitialMenuItems()

    ) {
        self.menuType = menuType
        self.menuItems = menuItems

    }


}

enum MenuType {
    case settingsMenu

}

class MenuItem: Identifiable {
    let id = UUID()

    let menuTitle: String
    let menuDescription: String
    let menuIcon: String
    let layoutDirection: LayoutDirection
    var menuAction: () -> Void
    let pageType: PageType?


    init(menuTitle: String,
         menuDescription: String,
         menuIcon: String,
         menuAction: @escaping () -> Void,
         layoutDirection: LayoutDirection = .rightToLeft,
         pageType: PageType? = nil
    ) {
        self.menuTitle = menuTitle
        self.menuDescription = menuDescription
        self.menuIcon = menuIcon
        self.layoutDirection = layoutDirection
        self.menuAction = menuAction
        self.pageType = pageType
    }


/*
    func toJson(object: MenuItem) async -> Data? {

        return try? JSONEncoder().encode(object)
    }

    func toJsonList(listMenuItems: [MenuItem]) async -> Data? {
        let menuItemData = try? JSONSerialization.data(withJSONObject: listMenuItems, options: [])
        guard let jsonDataNonEncoded = menuItemData else {
            return nil
        }
        guard let jsonDataEncoded = try? JSONEncoder().encode(jsonDataNonEncoded) else {
            return nil
        }
        return jsonDataEncoded
    }

    func fromJson(jsonData: Data) async -> MenuItem? {
        guard let menuItem = try? JSONDecoder().decode(MenuItem.self, from: jsonData) else {
            return nil
        }
        return menuItem

    }

    func fromJsonArray(jsonDataArray: [[String: Any]]) async -> [MenuItem]? {
        let data = try? JSONSerialization.data(withJSONObject: jsonDataArray, options: [])
        guard let jsonData = data else {
            return nil
        }
        guard let menuItemList = try? JSONDecoder().decode([MenuItem].self, from: jsonData) else {
            return nil
        }
        return menuItemList
    }*/

}

func renderInitialMenuItems() -> [MenuItem] {
    return [
        MenuItem(menuTitle: "Content", menuDescription: "content_description", menuIcon: "square.3.layers.3d", menuAction: {}, layoutDirection: .rightToLeft, pageType: .contents),
        MenuItem(menuTitle: "Account", menuDescription: "account_description", menuIcon: "person.circle", menuAction: {}, layoutDirection: .rightToLeft, pageType: .account),
        MenuItem(menuTitle: "Notifications", menuDescription: "notifications_description", menuIcon: "bell", menuAction: {}, layoutDirection: .rightToLeft, pageType: .notifications),
        MenuItem(menuTitle: "Support", menuDescription: "support_description", menuIcon: "person.crop.circle.badge.questionmark", menuAction: {}, layoutDirection: .rightToLeft, pageType: .support),
        MenuItem(menuTitle: "Terms of Use", menuDescription: "terms_of_use_description", menuIcon: "key", menuAction: {}, layoutDirection: .rightToLeft, pageType: .terms),
        MenuItem(menuTitle: "Billing", menuDescription: "billing description", menuIcon: "wallet.bifold", menuAction: {}, layoutDirection: .rightToLeft, pageType: .billing),
        MenuItem(menuTitle: "Privacy", menuDescription: "privacy_description", menuIcon: "lock", menuAction: {}, layoutDirection: .rightToLeft, pageType: .privacy),
        MenuItem(menuTitle: "Partnership", menuDescription: "partnership_description", menuIcon: "sharedwithyou", menuAction: {}, layoutDirection: .rightToLeft, pageType: .partnership),
        MenuItem(menuTitle: "Logout", menuDescription: "logout_description", menuIcon: "rectangle.portrait.and.arrow.forward", menuAction: {}, layoutDirection: .leftToRight, pageType: nil)
    ]
}




