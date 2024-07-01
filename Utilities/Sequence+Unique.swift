import Foundation

extension Sequence where Element: Hashable {
    
    /// Returns an array with the unique elements of the sequence, preserving their order.
    ///
    /// - Returns: An array with the unique elements of the sequence.
    ///
    /// - Usage:
    /// ```swift
    /// let array = [1, 2, 2, 3, 4, 4, 5]
    /// let uniqueArray = array.unique()
    /// print(uniqueArray) // [1, 2, 3, 4, 5]
    /// ```
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    func unique() -> [Element] {
        var seen: Set<Element> = []
        return filter { seen.insert($0).inserted }
    }
}

// MARK: - Example Usage

let array = [1, 2, 2, 3, 4, 4, 5]
let uniqueArray = array.unique()
print(uniqueArray) // [1, 2, 3, 4, 5]
