//
//  Images.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 19.06.2022.
//

import SwiftUI
import Rswift

typealias Images = R.image

extension ImageResource {
    var image: Image {
        Image(name)
    }
}
