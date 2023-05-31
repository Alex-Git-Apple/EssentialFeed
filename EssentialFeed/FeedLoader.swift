//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Pin Lu on 5/31/23.
//

import Foundation

enum LoadFeedResult {
    case sucess([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
