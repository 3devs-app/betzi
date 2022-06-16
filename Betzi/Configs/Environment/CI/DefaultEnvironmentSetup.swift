//
//  DefaultEnvironmentSetup.swift
//  Betzi
//
//  Created by Luis Chavez pozo on 16/06/22.
//

import Foundation

struct DefaultEnvironmentSetup: EnvironmentSetup {
        static var envionments: [String: Any] = {
            var env: [String: Any] = [:]
            let environments = EnvironmentKey.allCases
            environments.forEach { environment in
                switch environment {
                case .baseURL : env[environment.rawValue] = "BASE_URL"
                case .ApiKey: env[environment.rawValue] = "API_KEY"
                }
            }
            return env
        }()
}
