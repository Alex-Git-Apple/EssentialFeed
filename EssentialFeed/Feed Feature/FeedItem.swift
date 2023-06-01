//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Pin Lu on 5/31/23.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
