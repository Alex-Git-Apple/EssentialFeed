//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Pin Lu on 6/1/23.
//

import Foundation

public enum HTTPClientResult {
    case success(HTTPURLResponse, Data)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
