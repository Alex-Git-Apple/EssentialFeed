//
//  FeedItemMapper.swift
//  EssentialFeed
//
//  Created by Pin Lu on 6/1/23.
//

import Foundation


internal final class FeedItemsMapper {
    private struct Root: Codable {
        var items: [Item]
    }

    private struct Item: Codable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedItem {
            return FeedItem(
                id: id,
                description: description,
                location: location,
                imageURL: image)
        }
    }
    
    private static let OK_200 = 200
    
    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
        guard response.statusCode == OK_200 else {
            throw RemoteFeedLoader.Error.invalidData
        }
        let root = try JSONDecoder().decode(Root.self, from: data)
        
        return root.items.map{ $0.item }
    }
}
