import Foundation

/// Extension to conform String to LocalizedError for easy error throwing with text descriptions.
extension String: LocalizedError {
    
    /**
     Provides the localized description for the error.
     
     - Returns: The string itself as the error description.
     
     - Usage:
     ```swift
     do {
         throw "An error occurred"
     } catch {
         print(error.localizedDescription) // Prints: An error occurred
     }
     ```
     
     - Time Complexity: O(1)
     - Space Complexity: O(1)
     - Use Cases: Quickly throwing errors with custom messages.
     - Dependencies: Foundation
     - Swift Version: 5.0+
     - Platform: iOS 10.0+
     */
    public var errorDescription: String? {
        return self
    }
}

// MARK: - Usage Example

/*
do {
    throw "An error occurred"
} catch {
    print(error.localizedDescription) // Prints: An error occurred
}
*/
