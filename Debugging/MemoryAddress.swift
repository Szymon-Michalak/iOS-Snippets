import Foundation

/// A utility struct for finding memory address of any type T
    
    /**
     Finds and stores object's memory address.
     
     - Parameters:
        - structPointer: a value object prefixed with &
        - classInstance: a class object
     
     - Returns: 
     - Throws: 
     
     - Usage:
     ```swift
     let array: [Int] = []
     MemoryAddress(&array)
     ```
     
     - Time Complexity: O(1)
     - Space Complexity: O(1)
     - Use Cases: For memory debugging
     - Dependencies: Foundation
     - Swift Version: 
     - Platform: 
     */
public struct MemoryAddress<T>: CustomStringConvertible {
    let intValue: Int

    public var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }

    // Initializer for structures
    public init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

// Extend the MemoryAddress struct to handle class instances where T is a subclass of AnyObject
extension MemoryAddress where T: AnyObject {
     // Initializer for classes
    init(of classInstance: T) {
        intValue = unsafeBitCast(classInstance, to: Int.self)
    }
}