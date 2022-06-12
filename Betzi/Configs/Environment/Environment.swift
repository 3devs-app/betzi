//
//  Environment.swift
//  Betzi
//
//  Created by James Junior Chirinos Pinedo on 26/05/22.
//

import Foundation

enum EnvironmentKey: String, CaseIterable {
    case baseURL = "BASE_URL"
    case ApiKey = "API_KEY"
}

struct Environment {
    static func get<T>(type: T.Type, for key: EnvironmentKey) -> T? {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let environments = dict["Environment"] as? [String: Any]
        else { return nil }
        let environment = environments[key.rawValue] as? T
        return environment
    }
}
