import Combine
import Foundation

/// Extension for AnyPublisher where the output type is Void.
extension AnyPublisher where Self.Output == Void {
    
    /**
     Attaches a subscriber with closure-based behavior for when the publisher completes.
     
     - Parameter receiveCompletion: The closure to execute on completion.
     - Returns: An AnyCancellable instance. Call cancel() on this instance when you no longer want the publisher to emit elements, and to request that the publisher stop.
     
     - Usage:
     ```swift
     myPublisher.sink { completion in
         switch completion {
         case .finished:
             print("Finished")
         case .failure(let error):
             print("Failed with error: \(error)")
         }
     }
     ```
     
     - Time Complexity: O(1)
     - Space Complexity: O(1)
     - Use Cases: Handling completion of publishers that emit Void output.
     - Dependencies: Combine, Foundation
     - Swift Version: 5.3+
     - Platform: iOS 13.0+
     */
    func sink(receiveCompletion: @escaping (Subscribers.Completion<Self.Failure>) -> Void) -> AnyCancellable {
        return sink(receiveCompletion: receiveCompletion) { _ in }
    }
}
