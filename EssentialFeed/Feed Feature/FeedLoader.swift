//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Pin Lu on 5/31/23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
