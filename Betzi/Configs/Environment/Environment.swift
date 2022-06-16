//
//  Environment.swift
//  Betzi
//
//  Created by James Junior Chirinos Pinedo on 26/05/22.
//

import Foundation

enum EnvironmentKey: String, CaseIterable {
    case baseURL
    case ApiKey
}

protocol EnvironmentSetup {
    static var envionments: [String: Any] { get }
}

struct Environment {
    static func get<T>(type: T.Type, for Key: EnvironmentKey) -> T? {
        let envionments = DefaultEnvironmentSetup.envionments
        let environment = envionments[Key.rawValue] as? T
        return environment
    }
}
