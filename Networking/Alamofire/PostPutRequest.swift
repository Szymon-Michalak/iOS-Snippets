import Alamofire
import Foundation

/// A utility class for network operations.
class NetworkManager {
    
    /**
     Makes a POST or PUT request to the specified URL with the given parameters and prints the response data.
     
     - Parameters:
        - urlString: The string representation of the URL to make the request to.
        - method: The HTTP method (POST or PUT).
        - parameters: The parameters to include in the request body.
        - completion: A completion handler that takes the response data, response, and error.
     
     - Returns: Void
     - Throws: Error if the URL is invalid or the network request fails.
     
     - Usage:
     ```swift
     let customer = CustomerAddress(addresses: [address])
     let putObject = PutAddress(customer: customer)
     NetworkManager.postPutRequest(urlString: "https://api.example.com/update", method: .put, parameters: putObject) { data, response, error in
         if let error = error {
             print("Error: \(error)")
         } else {
             print("Response data: \(String(describing: data))")
         }
     }
     ```
     
     - Time Complexity: O(n) where n is the size of the data being uploaded
     - Space Complexity: O(n) where n is the size of the data being uploaded
     - Use Cases: Sending data to a REST API using POST or PUT
     - Dependencies: Alamofire, Foundation
     - Swift Version: 5.3+
     - Platform: iOS 8.0+
     */
    static func postPutRequest<T: Encodable>(urlString: String, method: HTTPMethod, parameters: T, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        AF.request(url, method: method, parameters: parameters, encoder: JSONParameterEncoder.default).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    let prettyJsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                    if let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) {
                        print("prettyJsonData = \(prettyPrintedJson)")
                    }
                } catch {
                    print("Error: Cannot convert data to JSON object")
                }
                completion(data, response.response, nil)
            case .failure(let error):
                completion(nil, response.response, error)
            }
        }
    }
}
