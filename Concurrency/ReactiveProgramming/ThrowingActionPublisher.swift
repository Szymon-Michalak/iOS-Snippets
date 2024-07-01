import Combine
import Foundation

/// A utility class for network operations.
class NetworkManager {
    
    /**
     Creates a publisher that performs a throwing action and emits a Void value upon success or an error upon failure.
     
     - Returns: A publisher emitting Void on success or an Error on failure.
     
     - Usage:
     ```swift
     NetworkManager.performThrowingAction()
         .sink(receiveCompletion: { completion in
             switch completion {
             case .finished:
                 print("Action succeeded")
             case .failure(let error):
                 print("Action failed with error: \(error)")
             }
         }, receiveValue: {
             print("Received Void output")
         })
         .store(in: &cancellables)
     ```
     
     - Time Complexity: O(1)
     - Space Complexity: O(1)
     - Use Cases: Integrating traditional throwing functions with Combine framework.
     - Dependencies: Combine, Foundation
     - Swift Version: 5.3+
     - Platform: iOS 13.0+
     */
    static func performThrowingAction() -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            do {
                try throwingAction()
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    // Example throwing action function
    private static func throwingAction() throws {
        // Perform some action that might throw an error
    }
}
