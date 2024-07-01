import Foundation

/// A utility class for creating URLs with percent encoding.
class URLHelper {
    
    /**
     Creates a URL from the given base string and query parameters.
     
     - Parameters:
        - baseString: The base URL string.
        - queryParams: A dictionary of query parameters to include in the URL.
     - Returns: A URL with percent encoded query parameters, or nil if the URL is invalid.
     
     - Usage:
     ```swift
     if let url = URLHelper.createURL(baseString: "https://api.example.com/search", queryParams: ["query": "swift programming"]) {
         print(url)
     }
     ```
     
     - Time Complexity: O(n) where n is the number of characters in the query parameters.
     - Space Complexity: O(n)
     - Use Cases: Creating URLs for network requests with query parameters.
     - Dependencies: Foundation
     - Swift Version: 5.0+
     - Platform: iOS 10.0+
     */
    static func createURL(baseString: String, queryParams: [String: String]) -> URL? {
        guard var urlComponents = URLComponents(string: baseString) else {
            return nil
        }
        
        urlComponents.queryItems = queryParams.map { (key, value) in
            URLQueryItem(name: key, value: value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        }
        
        return urlComponents.url
    }
}

// MARK: - Usage Example

/*
if let url = URLHelper.createURL(baseString: "https://api.example.com/search", queryParams: ["query": "swift programming"]) {
    print(url) // Prints: https://api.example.com/search?query=swift%20programming
}
*/
