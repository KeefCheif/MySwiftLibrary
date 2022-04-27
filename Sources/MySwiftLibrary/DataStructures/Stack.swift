//
//  Stack.swift
//  
//
//  Created by peter allgeier on 4/26/22.
//

public struct Stack<T> {
    
    private var items: [T] = [T]()
    
    public var isEmpty: Bool {
        return self.items.isEmpty
    }
    
    public var count: Int {
        return self.items.count
    }
    
    public mutating func push(_ element: T) {
        self.items.append(element)
    }
    
    public mutating func pop() -> T? {
        return self.items.popLast()
    }
    
    public func peek() -> T? {
        return self.items.last
    }
}
