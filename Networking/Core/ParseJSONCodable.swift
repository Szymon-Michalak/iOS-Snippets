import Foundation

/// A utility class for JSON parsing.
class JSONParser {
    
    /**
     Parses JSON data into a specified `Codable` type.
     
     - Parameter data: The JSON data to parse.
     - Parameter type: The type to parse the data into.
     - Returns: An instance of the specified type if parsing is successful.
     - Throws: An error if parsing fails.
     
     - Usage:
     ```swift
     let jsonData = ... // some JSON data
     do {
         let parsedObject = try JSONParser.parse(data: jsonData, type: MyCodableType.self)
         print("Parsed object: \(parsedObject)")
     } catch {
         print("Error parsing JSON: \(error)")
     }
     ```
     
     - Time Complexity: O(n) where n is the size of the JSON data
     - Space Complexity: O(n) where n is the size of the JSON data
     - Use Cases: Parsing JSON responses from a REST API
     - Dependencies: Foundation
     - Platform: iOS 11.0+
     */
    static func parse<T: Codable>(data: Data, type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        // Customize the decoder if necessary, e.g., dateDecodingStrategy
        // decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}
