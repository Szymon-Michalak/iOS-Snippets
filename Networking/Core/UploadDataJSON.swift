import Foundation

/// A utility class for network operations.
class NetworkManager {
    
    /**
     Uploads JSON data to the specified URL.
     
     - Parameters:
        - urlString: The string representation of the URL to upload data to.
        - jsonData: The JSON data to upload.
        - completion: A completion handler that takes a result containing either the response data or an error.
     
     - Returns: Void
     - Throws: Error if the URL is invalid or the network request fails.
     
     - Usage:
     ```swift
     let jsonData = ... // some JSON data
     NetworkManager.uploadData(to: "https://api.example.com/upload", jsonData: jsonData) { result in
         switch result {
         case .success(let data):
             print("Upload successful, response data: \(data)")
         case .failure(let error):
             print("Error uploading data: \(error)")
         }
     }
     ```
     
     - Time Complexity: O(n) where n is the size of the data being uploaded
     - Space Complexity: O(1)
     - Use Cases: Uploading JSON data to a REST API
     - Dependencies: Foundation
     - Platform: iOS 7.0+
     */
    static func uploadData(to urlString: String, jsonData: Data, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No response data", code: 0, userInfo: nil)))
                return
            }

            completion(.success(data))
        }

        task.resume()
    }
}
