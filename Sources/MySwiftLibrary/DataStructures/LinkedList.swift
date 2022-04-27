//
//  File.swift
//  
//
//  Created by peter allgeier on 4/26/22.
//

import Foundation

public class Node<T> {
    
    public var value: T
    public var next: Node<T>?
    public weak var previous: Node<T>?
    
    public init(_ val: T) {
        self.value = val
    }
}


// A Singly Linked List
public class LinkedList<E> {
    
    private(set) var head: Node<E>?
    private(set) var tail: Node<E>?
    
    public init() {
        self.head = nil
        self.tail = nil
    }
    
    public init(_ value: E) {
        let new_node = Node(value)
        self.head = new_node
        self.tail = new_node
    }
    
    public var isEmpty: Bool {
        return self.head == nil
    }
    
    public func append(_ value: E) {
        
        let new_node = Node(value)
        
        if self.isEmpty {
            self.head = new_node
            self.tail = self.head
        } else {
            self.tail!.next = new_node
            self.tail = self.tail!.next
        }
    }
    
    public func insert(_ value: E, at: Int) {
        
        guard at >= 0 else { return }
        guard !self.isEmpty else {              // If the list is empty just add the new value
            self.append(value)
            return
        }
        
        let new_node = Node(value)
        
        var crawler = self.head
        var previous_node: Node<E>? = nil
        var counter: Int = 0
        
        while crawler != nil && counter != at {
            counter += 1
            previous_node = crawler
            crawler = crawler!.next
        }
        
        guard crawler != nil && counter == at else {
            self.append(value)
            return
        }
        
        new_node.next = crawler
        
        if let previous_node = previous_node {
            previous_node.next = new_node
        } else {
            self.head = new_node
        }
    }
    
    public func nodeAt(index: Int) -> Node<E>? {
        
        guard index >= 0 else { return nil }
        
        var counter: Int = 0
        var crawler = self.head
        
        while crawler != nil {
            guard counter != index else { return crawler }
            crawler = crawler!.next
            counter += 1
        }
        
        return nil
    }
    
    
    /*
     Takes a node and removes it from the linked list & returns it
     */
    public func remove(node: Node<E>) -> E? {
        
        guard !self.isEmpty else { return nil }
        
        var previous_node: Node<E>? = nil
        var crawler = self.head
        
        while crawler != nil && crawler! !== node {
            previous_node = crawler
            crawler = crawler!.next
        }
        
        guard crawler != nil else { return nil }    // The node was not found
        
        if let previous_node = previous_node {
            
            previous_node.next = node.next
            
            if node === self.tail {                 // Adjust the tail
                self.tail = previous_node
            }
            
        } else {                                    // The node is the head of the list
            self.head = self.head!.next
        }
        
        return node.value
    }
    
    public func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
