//
//  AsyncImage.swift
//  Swiftui_2_5_7
//
//  Created by Muhammad Zulqurnain on 07/03/2023.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {

  @StateObject private var loader: ImageLoader
  
  private let placeholder: Placeholder
  private let image: (UIImage) -> Image
  
  init(
    url: URL?,
    @ViewBuilder placeholder: () -> Placeholder,
    @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
  ) {
    self.placeholder = placeholder()
    self.image = image
    _loader = StateObject(wrappedValue: ImageLoader(url: url))
  }
  
  var body: some View {
    content.onAppear(perform: loader.load)
  }
  
  private var content: some View {
    Group {
      if let image = loader.image {
        self.image(image)
      } else {
        placeholder
      }
    }
  }
}
