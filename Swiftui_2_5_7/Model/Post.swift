//
//  Post.swift
//  Swiftui_2_5_7
//
//  Created by Muhammad Zulqurnain on 07/03/2023.
//

import Foundation

struct Post: Codable, Identifiable {
  let id: Int
  let title: String
  let url: String
  let thumbnailUrl: String
}
