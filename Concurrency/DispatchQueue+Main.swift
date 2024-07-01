import Foundation

extension DispatchQueue {
    
    /**
     Executes a closure on the main thread. If already on the main thread, the closure is executed immediately; otherwise, it is dispatched asynchronously.
     
     - Parameter completion: The closure to execute on the main thread.
     
     - Usage:
     ```swift
     DispatchQueue.performOnMain {
         // UI updates or other main-thread tasks
         print("Executing on the main thread")
     }
     ```
     
     - Time Complexity: O(1)
     - Space Complexity: O(1)
     - Use Cases: Ensuring tasks are executed on the main thread, especially useful for UI updates.
     - Dependencies: Foundation
     - Swift Version: 5.0+
     - Platform: iOS 10.0+
     */
    class func performOnMain(_ completion: @escaping @convention(block) () -> ()) {
        if Thread.isMainThread {
            completion()
        } else {
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
