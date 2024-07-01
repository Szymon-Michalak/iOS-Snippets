import Foundation

/// A utility class for custom JSON parsing.
class CustomJSONParser {
    
    /**
     Parses JSON data into a dictionary.
     
     - Parameter data: The JSON data to parse.
     - Returns: A dictionary representing the JSON data.
     - Throws: An error if parsing fails.
     
     - Usage:
     ```swift
     let jsonData = ... // some JSON data
     do {
         let parsedDictionary = try CustomJSONParser.parse(data: jsonData)
         print("Parsed dictionary: \(parsedDictionary)")
     } catch {
         print("Error parsing JSON: \(error)")
     }
     ```
     
     - Time Complexity: O(n) where n is the size of the JSON data
     - Space Complexity: O(n) where n is the size of the JSON data
     - Use Cases: Parsing JSON responses that do not fit into a predefined model
     - Dependencies: Foundation
     - Platform: iOS 2.0+
     */
    static func parse(data: Data) throws -> [String: Any] {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dictionary = jsonObject as? [String: Any] else {
            throw NSError(domain: "Invalid JSON format", code: 0, userInfo: nil)
        }
        return dictionary
    }
}
