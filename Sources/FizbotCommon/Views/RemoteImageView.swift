//
//  RemoteImageView.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import SwiftUI

public struct RemoteImageView<ConfiguredImage: View>: View {
    var url: URL?
    private let image: (Image) -> ConfiguredImage

    @ObservedObject var imageLoader: ImageLoaderService
    @State var imageData: UIImage?

    public init(
        url: URL?,
        @ViewBuilder image: @escaping (Image) -> ConfiguredImage
    ) {
        self.url = url
        self.image = image
        self.imageLoader = ImageLoaderService(url: url)
    }

    @ViewBuilder private var imageContent: some View {
        if let data = imageData {
            image(Image(uiImage: data))
        } else {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .darkColor))
        }
    }

    public var body: some View {
        imageContent
            .onReceive(imageLoader.$image) { imageData in
                self.imageData = imageData
            }
    }
}

class ImageLoaderService: ObservableObject {
    @Published var image = UIImage()

    convenience init(url: URL?) {
        self.init()
        loadImage(for: url)
    }

    func loadImage(for url: URL?) {
        if let url {
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data) ?? UIImage()
                }
            }
            task.resume()
        }
    }
}
