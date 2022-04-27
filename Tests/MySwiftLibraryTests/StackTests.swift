//
//  File.swift
//  
//
//  Created by peter allgeier on 4/26/22.
//

import XCTest
@testable import MySwiftLibrary

final class StackTests: XCTestCase {
    
    func testStackInsert() throws {
        
        var test_stack = Stack<Int>()
        
        test_stack.push(0)
        test_stack.push(1)
        
        XCTAssertEqual(1, test_stack.peek())
    }
    
    func testStackRemove() throws {
        
        var test_stack = Stack<Int>()
        
        test_stack.push(0)
        test_stack.push(1)
        
        XCTAssertEqual(1, test_stack.pop())
        XCTAssertEqual(0, test_stack.pop())
        
        XCTAssertNil(test_stack.pop())
        
    }
    
    func testStackPeek() throws {
        
        let test_stack = Stack<Int>()
        
        XCTAssertNil(test_stack.peek())
    }
    
    func testStackEmpty() throws {
        
        var test_stack = Stack<Int>()
        
        XCTAssertTrue(test_stack.isEmpty)
        
        test_stack.push(0)
        
        XCTAssertFalse(test_stack.isEmpty)
    }
    
    func testStackCount() throws {
        
        var test_stack = Stack<Int>()
        
        XCTAssertEqual(0, test_stack.count)
        
        test_stack.push(0)
        
        XCTAssertEqual(1, test_stack.count)
    }
}
