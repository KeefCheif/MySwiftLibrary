//
//  File.swift
//  
//
//  Created by peter allgeier on 5/2/22.
//

import XCTest
@testable import MySwiftLibrary

final class QueueTests: XCTestCase {
    
    func testQueue() throws {
        
        var queue: Queue<Int> = Queue<Int>()
        XCTAssertNil(queue.peek())
        
        queue.enqueue(10)
        XCTAssertEqual(10, queue.peek())
        
        queue.enqueue(12)
        XCTAssertEqual(10, queue.peek())
    }
    
    func testDequeue() throws {
        
        var queue: Queue<Int> = Queue<Int>()
        
        queue.enqueue(10)
        queue.enqueue(11)
        queue.enqueue(12)
        
        XCTAssertEqual(10, queue.dequeue())
        XCTAssertEqual(11, queue.dequeue())
        XCTAssertEqual(12, queue.dequeue())
        XCTAssertNil(queue.dequeue())
    }
    
    func testQueueDequeue() throws {
        
        var queue: Queue<Int> = Queue<Int>()
        XCTAssertNil(queue.peek())
        
        queue.enqueue(10)
        XCTAssertEqual(10, queue.peek())
        
        queue.enqueue(12)
        XCTAssertEqual(10, queue.peek())
        
        XCTAssertEqual(10, queue.dequeue())
        XCTAssertEqual(12, queue.dequeue())
        XCTAssertNil(queue.peek())
    }
}
