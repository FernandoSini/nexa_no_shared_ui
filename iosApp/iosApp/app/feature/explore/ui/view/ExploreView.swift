//
// Created by Fernando Fazio Sinigaglia on 06/10/25.
//

import Foundation
import SwiftUI
import Shared


struct ExploreView: View {
    @Binding var path: NavigationPath
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            Section {
                HStack {
                    ZStack {
                        TextField("Explore", text: $searchText)
                            .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))
                            .frame(height: 50)
                            .padding(.leading, 10)
                    }
                    Button {
                    } label: {
                        Image(systemName: searchText.count > 0 ? "magnifyingglass" : "slider.horizontal.3")
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(.blue).cornerRadius(10)
                    }


                }

                .frame(maxWidth: .infinity)
                .background(Color(hex: 0xff787878, alpha: 0.15))
                .cornerRadius(10)
            }
            .safeAreaPadding(.horizontal, 20)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
            List {
            }
            .listRowBackground(Color.clear)

        }
        .background(Color(hex: 0xff151218))
    }
}