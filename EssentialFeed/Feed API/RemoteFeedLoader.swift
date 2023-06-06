//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Pin Lu on 5/31/23.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult<Error>
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success(response, data):
                completion(FeedItemsMapper.map(response, data))
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
    
}

