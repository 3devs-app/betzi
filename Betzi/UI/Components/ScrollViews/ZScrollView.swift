//
//  ZScrollView.swift
//  Betzi
//
//  Created by Daniel Yopla on 05.11.2022.
//

import SwiftUI

struct ZScrollView<ScrollableContent: View, FixedContent: View>: View {
    let scrollableContent: () -> ScrollableContent
    let fixedContent: () -> FixedContent

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                scrollableContent()
            }

            fixedContent()
        }
    }
}
