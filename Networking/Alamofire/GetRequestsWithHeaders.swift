import Alamofire
import Foundation

/// A utility class for network operations.
class NetworkManager {
    
    /**
     Makes a GET request to the specified URL with the given headers and decodes the JSON response.
     
     - Parameters:
        - urlString: The string representation of the URL to make the GET request to.
        - headers: The HTTP headers to include in the request.
        - completion: A completion handler that takes a result containing either the decoded model or an error.
     
     - Returns: Void
     - Throws: Error if the URL is invalid or the network request fails.
     
     - Usage:
     ```swift
     let headers: HTTPHeaders = ["app-id": "62fb78b30fb89e62ca11c547"]
     NetworkManager.getRequest(urlString: "https://api.example.com/data", headers: headers) { (result: Result<MyModel, Error>) in
         switch result {
         case .success(let model):
             print("Success: \(model)")
         case .failure(let error):
             print("Error: \(error)")
         }
     }
     ```
     
     - Time Complexity: O(n) where n is the size of the data being fetched
     - Space Complexity: O(n) where n is the size of the data being fetched
     - Use Cases: Fetching JSON data from a REST API with headers
     - Dependencies: Alamofire, Foundation
     - Swift Version: 5.3+
     - Platform: iOS 8.0+
     */
    static func getRequest<T: Decodable>(urlString: String, headers: HTTPHeaders, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        AF.request(url, headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
