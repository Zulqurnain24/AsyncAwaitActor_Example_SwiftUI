//
//  Networking.swift
//  Swiftui_2_5_7
//
//  Created by Muhammad Zulqurnain on 07/03/2023.
//

import Foundation

enum API {
  static func fetchPosts() async throws -> [Post] {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return [] }
    let (data, _) = try await URLSession.shared.data(from: url)
    do {
      return try JSONDecoder().decode([Post].self, from: data)
    } catch {
      print("encountered error: \(error.localizedDescription)")
    }
    return []
  }
}
