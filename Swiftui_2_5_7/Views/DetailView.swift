//
//  DetailView.swift
//  Swiftui_2_5_7
//
//  Created by Muhammad Zulqurnain on 07/03/2023.
//

import SwiftUI

struct DetailView: View {
  let post: Post
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: post.url)) {
        ProgressView()
      }
      .frame(height: 200)
      
      Text(post.title)
    }
  }
}
