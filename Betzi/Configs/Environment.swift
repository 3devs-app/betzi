//
//  Environment.swift
//  Betzi
//
//  Created by James Junior Chirinos Pinedo on 26/05/22.
//

import Foundation

public enum Environment {
  
  // MARK: - Keys
  enum Keys {
    enum Plist {
      static let rootURL = "ROOT_URL"
      static let apiKey = "API_KEY"
    }
  }

  // MARK: - Environment values
  static let rootURL: URL = {
    guard let rootURLstring = ProcessInfo.processInfo.environment[Keys.Plist.rootURL] else {
      fatalError("Root URL not set in plist for this environment")
    }
    guard let url = URL(string: rootURLstring) else {
      fatalError("Root URL is invalid")
    }
    return url
  }()

  static let apiKey: String = {
    guard let apiKey = ProcessInfo.processInfo.environment[Keys.Plist.apiKey] else {
      fatalError("API Key not set in plist for this environment")
    }
    return apiKey
  }()
}
