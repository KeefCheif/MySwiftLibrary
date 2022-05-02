//
//  File.swift
//  
//
//  Created by peter allgeier on 4/26/22.
//

public struct Queue<T> {
    
    private var items: LinkedList<T>
    
    public var isEmpty: Bool {
        return items.isEmpty
    }
    
    public init() {
        self.items = LinkedList<T>()
    }
    
    public mutating func enqueue(_ value: T) {
        self.items.append(value)
    }
    
    public mutating func dequeue() -> T? {
        guard !self.items.isEmpty else { return nil }
        return self.items.remove(node: self.items.head!)
    }
    
    public func peek() -> T? {
        return self.items.head?.value
    }
}
