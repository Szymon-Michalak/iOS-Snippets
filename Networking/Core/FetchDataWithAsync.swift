import Foundation

/// A utility class for network operations.
class NetworkManager {
    
    /**
     Fetches data from the given URL string asynchronously.
     
     - Parameter urlString: The string representation of the URL to fetch data from.
     - Returns: The fetched data.
     - Throws: An error if the URL is invalid or the network request fails.
     
     - Usage:
     ```swift
     Task {
         do {
             let data = try await NetworkManager().fetchData(from: "https://api.example.com/data")
             print("Data received: \(data)")
         } catch {
             print("Error: \(error)")
         }
     }
     ```
     
     - Time Complexity: O(n) where n is the size of the data being fetched
     - Space Complexity: O(1)
     - Use Cases: Fetching JSON data from a REST API using modern async/await syntax
     - Dependencies: Foundation
     - Platform: iOS 15.0+
     */
    func fetchData(from urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }

        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
        }

        return data
    }
}
