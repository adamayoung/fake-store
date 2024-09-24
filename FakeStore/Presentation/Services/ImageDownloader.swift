//
//  ImageDownloader.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation
import UIKit

actor ImageDownloader {

    private let urlSession: URLSession
    private let cache = NSCache<NSURL, Box>()

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    @discardableResult
    func download(url: URL) async -> UIImage? {
        let nsURL = url as NSURL

        if let status = cache.object(forKey: nsURL)?.status {
            switch status {
            case let .fetched(image):
                print("Cache HIT: \(url.absoluteString)")
                return image

            case let .inProgress(task):
                return await task.value
            }
        }

        print("Cache MISS: \(url.absoluteString)")

        let task: Task<UIImage?, Never> = Task {
            do {
                let (imageData, _) = try await urlSession.data(from: url)
                let image = UIImage(data: imageData)
                return image
            } catch {
                return nil
            }
        }

        cache.setObject(Box(.inProgress(task)), forKey: nsURL)

        let image = await task.value

        if let image {
            cache.setObject(Box(.fetched(image)), forKey: nsURL)
        }

        return image
    }

}

extension ImageDownloader {

    private final class Box: AnyObject {

        let status: LoaderStatus

        init(_ status: LoaderStatus) {
            self.status = status
        }
    }

    private enum LoaderStatus {
        case inProgress(Task<UIImage?, Never>)
        case fetched(UIImage)
    }

}
