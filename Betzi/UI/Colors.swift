//
//  Colors.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 04.07.2022.
//

import SwiftUI
import Rswift

typealias Colors = R.color

extension ColorResource {
    var color: Color {
        Color(name)
    }
}

extension View {
    func foregroundColor(_ color: ColorResource) -> some View {
        self.foregroundColor(color.color)
    }

    func background(_ color: ColorResource) -> some View {
        self.background(color.color)
    }

    func backgroundIgnoringSafeArea(_ color: ColorResource, edges: Edge.Set) -> some View {
        self.background(color.color.ignoresSafeArea(.all, edges: edges))
    }
}

extension Shape {
    func fill(_ color: ColorResource) -> some View {
        self.fill(color.color)
    }
}

extension Text {
    func foregroundColor(_ color: ColorResource) -> Text {
        self.foregroundColor(color.color)
    }
}
