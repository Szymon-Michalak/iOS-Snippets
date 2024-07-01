import Foundation

/// A utility class for network operations.
class NetworkManager {
    
    /**
     Fetches data from the given URL string.
     
     - Parameters:
        - urlString: The string representation of the URL to fetch data from.
        - completion: A completion handler that takes a result containing either the fetched data or an error.
     
     - Returns: Void
     - Throws: Error if the URL is invalid or the network request fails.
     
     - Usage:
     ```swift
     NetworkManager.fetchData(from: "https://api.example.com/data") { result in
         switch result {
         case .success(let data):
             print("Data received: \(data)")
         case .failure(let error):
             print("Error: \(error)")
         }
     }
     ```
     
     - Time Complexity: O(n) where n is the size of the data being fetched
     - Space Complexity: O(1)
     - Use Cases: Fetching JSON data from a REST API
     - Dependencies: Foundation
     - Platform: iOS 7.0+
     */
    static func fetchData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }

            completion(.success(data))
        }

        task.resume()
    }
}
