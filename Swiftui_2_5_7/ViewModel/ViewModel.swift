//
//  ViewModel.swift
//  Swiftui_2_5_7
//
//  Created by Muhammad Zulqurnain on 07/03/2023.
//

import SwiftUI

@MainActor
class ViewModel: ObservableObject{
  @Published var posts: [Post] = []
  
  func fetchPosts() async {
    do {
      posts = try await API.fetchPosts()
    } catch {
      print(error.localizedDescription)
    }
  }
}
