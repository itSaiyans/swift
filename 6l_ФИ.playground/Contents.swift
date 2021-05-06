import UIKit

struct Queue<Element: Comparable> {
    var elements = [Element]()
    
    mutating func enqueue(_ element: Element){
        elements.append(element)
    }
    
    mutating func dequeue() -> Element {
        return elements.removeFirst()
    }
    
    func filter(element: Element) {
        print("Find \(elements.filter{$0 == element})")
    }
    
    mutating func sorting() -> [Element] {
        return elements.sorted(by: > )
    }
    
    subscript (index: Int) -> Element? {
        return (index < elements.count ? elements[index] : nil)
    }
}

var user = Queue<String>(elements: ["Stas"])
user.enqueue("Mark")
user.enqueue("Andrey")
user.enqueue("Mary")

print(user.elements)
user.sorting()
print("Отсортирован: \(user.sorting())")

user.dequeue()
print(user.elements)
user.enqueue("Denis")
print(user.elements)

user.filter(element: "Andrey")
user.filter(element: "Stas")

print(user[1])
print(user[2])

