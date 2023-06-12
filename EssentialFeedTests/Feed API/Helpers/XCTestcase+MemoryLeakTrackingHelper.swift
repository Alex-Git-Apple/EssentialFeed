//
//  XCTestcase+MemoryLeakTrackingHelper.swift
//  EssentialFeedTests
//
//  Created by Pin Lu on 6/12/23.
//

import Foundation
import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
