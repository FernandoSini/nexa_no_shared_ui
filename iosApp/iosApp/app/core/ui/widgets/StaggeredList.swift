//
// Created by Fernando Fazio Sinigaglia on 10/10/25.
//

import Foundation
import SwiftUI

struct StaggeredList: View {
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject private var menuViewModel = MenuViewModel()
    private let leftColumn: [StaggeredItem] = []
    private let rightColumn: [StaggeredItem] = []
    let staggeredItems = [
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
        StaggeredItem(imageName: "magnifyingglass", imageDescription: "cu"),
    ]
    var body: some View {

        let (leftColumn, rightColumn): ([StaggeredItem], [StaggeredItem]) = {
            var left: [StaggeredItem] = []
            var right: [StaggeredItem] = []
            for (index, item) in staggeredItems.enumerated() {
                if index % 2 == 0 {
                    left.append(item)
                } else {
                    right.append(item)
                }
            }
            return (left, right)
        }()

        ScrollView {
            LazyVGrid(columns: columns) {
                LazyVStack(spacing: 10) {
                    ForEach(leftColumn) {
                        item in
                        StaggeredItemView(item: item)

                    }
                }
                LazyVStack {
                    ForEach(rightColumn) {
                        item in
                        StaggeredItemView(item: item)
                    }
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)


        }
    }


}

struct StaggeredItem: Identifiable {
    let id = UUID()
    let imageName: String
    let imageDescription: String

}

struct StaggeredItemView: View {
    var item: StaggeredItem
    var body: some View {
        VStack {
            Image(systemName: item.imageName)
            Text(item.imageDescription)

        }
        .frame(height: 300)
        .frame(maxWidth: .infinity)
        .background(Color.blue)

    }
}