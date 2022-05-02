//
//  LinkedListTests.swift
//  
//
//  Created by peter allgeier on 4/26/22.
//

import XCTest
@testable import MySwiftLibrary

final class LinkedListTests: XCTestCase {
    
    func testAppend() throws {
        
        let list = LinkedList<Int>()
        
        XCTAssertNil(list.head)
        
        list.append(10)
        
        XCTAssertEqual(10, list.head!.value)
        XCTAssertEqual(10, list.tail!.value)
        
        list.append(11)
        
        XCTAssertEqual(10, list.head!.value)
        XCTAssertEqual(11, list.tail!.value)
    }
    
    func testRemove() throws {
        
        let list = LinkedList<String>()
        
        list.append("Hello")
        list.append("my")
        list.append("name")
        list.append("is")
        
        XCTAssertEqual("Hello", list.remove(node: list.nodeAt(index: 0)!))
        XCTAssertEqual("my", list.head!.value)
        XCTAssertEqual("is", list.remove(node: list.tail!))
        XCTAssertEqual("name", list.tail!.value)
    }
    
    func testRemoveAll() throws {
        
        let list = LinkedList<Int>()
        
        list.append(11)
        list.append(20)
        list.append(14)
        list.removeAll()
        
        XCTAssertTrue(list.isEmpty)
    }
    
    func testInsert() throws {
        
        let list = LinkedList<Int>()
        
        list.insert(20, at: 0)
        XCTAssertEqual(20, list.head!.value)
        XCTAssertEqual(20, list.tail!.value)
        
        // Inserting at an index greater than the length of the list should append
        list.insert(21, at: 9)
        XCTAssertEqual(21, list.tail!.value)
        
        list .insert(0, at: 1)
        XCTAssertEqual(20, list.nodeAt(index: 0)!.value)
        XCTAssertEqual(0, list.nodeAt(index: 1)!.value)
        XCTAssertEqual(21, list.nodeAt(index: 2)!.value)
    }
    
    func testLinkListOperations() throws {
        
        let list = LinkedList<Int>()
        
        list.insert(0, at: 10)
        // 0
        XCTAssertEqual(0, list.head!.value)
        XCTAssertEqual(0, list.tail!.value)
        
        list.append(1)
        list.append(2)
        list.append(3)
        
        // 0 -> 1 -> 2 -> 3
        XCTAssertEqual(3, list.remove(node: list.nodeAt(index: 3)!))
        // 0 -> 1 -> 2
        XCTAssertEqual(2, list.tail!.value)
        
        list.append(3)
        list.append(4)
        
        // 0 -> 1 -> 2 -> 3 -> 4
        XCTAssertEqual(2, list.remove(node: list.nodeAt(index: 2)!))
        // 0 -> 1 -> 3 -> 4
        XCTAssertEqual(3, list.nodeAt(index: 2)!.value)
        
        list.insert(2, at: 2)
        
        // 0 -> 1 -> 2 -> 3 -> 4
        XCTAssertEqual(2, list.nodeAt(index: 2)!.value)
    }
}

