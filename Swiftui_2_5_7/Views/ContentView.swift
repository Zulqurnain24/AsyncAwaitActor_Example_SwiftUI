//
//  ContentView.swift
//  Swiftui_2_5_7
//
//  Created by Muhammad Zulqurnain on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel: ViewModel = ViewModel()
  
  var body: some View {
    NavigationView {
      List(viewModel.posts) { post in
        NavigationLink {
          DetailView(post: post)
        } label: {
          AsyncImage(url: URL(string: post.thumbnailUrl)) {
            ProgressView()
          }
          .frame(width: 50, height: 50)
          .cornerRadius(10)
          Text(post.title)
        }
      }.navigationTitle("Latest Posts")
    }.task {
      await viewModel.fetchPosts()
    }
  }
}
