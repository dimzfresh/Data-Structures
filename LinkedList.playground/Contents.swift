//MARK: Single Linked List - each element points to the next.

import UIKit

class Node<T> {
    var value: T?
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
    
    deinit {
        print("Node \(String(describing: value)) is deinit")
    }
}

class LinkedList<T> {
    fileprivate var head: Node<T>?
    
    var first: Node<T>? {
        return head
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        var index = 1
        var current = head
        while let next = current?.next {
            current = next
            index += 1
        }
        return index
    }
    
    required init(head: Node<T>) {
        guard self.head == nil else { return }
        self.head = head
    }
    
    deinit {
        print("Linked list is destroied!")
    }
    
    func append(_ new: Node<T>) {
        var current = head
        while let nextNode = current?.next {
            current = nextNode
        }
        current?.next = new
    }
    
    func remove(_ node: Node<T>) -> T? {
        if head === node, let next = node.next {
            head = nil
            head = next
            return node.value
        }
        
        var previous = head
        var current = head
        
        while current?.next != nil {
            if current === node {
                previous?.next = current?.next
                current = nil
                return node.value
            }
            previous = current
            current = current?.next
        }
        
        return nil
    }
}

let node1 = Node<Int>(value: 1)
let node2 = Node<Int>(value: 2)
let node3 = Node<Int>(value: 3)
let node4 = Node<Int>(value: 4)

let linkedList = LinkedList(head: node1)

linkedList.append(node2)
linkedList.append(node3)
linkedList.append(node4)

print("Linked list count is \(linkedList.count)")

linkedList.remove(node3)

print("Linked list count is \(linkedList.count)")

linkedList.remove(node1)

print("Linked list count is \(linkedList.count)")




