//
//  UserManager.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import Foundation

final class UserManager {
    enum State {
        case signedOut
        case signedIn
    }

    var state: State = .signedIn
}
