//
//  Array.swift
//  DKExtensions
//
//  Created by Кузин Дмитрий on 27.03.2019.
//

import UIKit

public extension Array {
    
    public func filterDuplicates(_ includeElement: (_ lhs: Element, _ rhs: Element) -> Bool) -> [Element] {
        var results = [Element]()
        
        forEach { (element) in
            let existingElements = results.filter { includeElement(element, $0) }
            if existingElements.isEmpty {
                results.append(element)
            }
        }
        
        return results
    }
    
}

public extension Array {
    
    public func itemBefore(_ index: Int) -> Element? {
        return item(at: index - 1)
    }
    
    public func itemAfter(_ index: Int) -> Element? {
        return item(at: index + 1)
    }
    
    public func item(at index: Int) -> Element? {
        guard index >= 0 && index < count else {
            return nil
        }
        return self[index]
    }
    
}

public extension Array where Element: NSLayoutConstraint {
    
    public func activate() {
        NSLayoutConstraint.activate(self)
    }
    
    public func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
    
}

public extension Array {
    
    public mutating func removeFirst(where predicate: (Element) throws -> Bool) rethrows {
        guard let index = try index(where: predicate) else {
            return
        }
        
        remove(at: index)
    }
    
}

public extension Sequence {
    public func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.append(element) {
                categories[key] = [element]
            }
        }
        return categories
    }
}
