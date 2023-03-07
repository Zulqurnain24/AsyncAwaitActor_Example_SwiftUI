//
//  ImageLoader.swift
//  Swiftui_2_5_7
//
//  Created by Muhammad Zulqurnain on 07/03/2023.
//

import UIKit

@MainActor
final class ImageLoader: ObservableObject {
  @Published var image: UIImage?
  
  private var url: URL?
  
  init(url: URL?) {
    self.url = url
  }
  
  func load() {
    guard let url = url else {
      return
    }
    
    Task {
      do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let image = UIImage(data: data)
        DispatchQueue.main.async {
          self.image = image
        }
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}
