import Foundation

/// A utility class for network operations.
class NetworkManager {
    
    /**
     Uploads multipart/form-data to the specified URL.
     
     - Parameters:
        - urlString: The string representation of the URL to upload data to.
        - parameters: The parameters to include in the multipart/form-data.
        - fileData: The file data to upload.
        - fileName: The name of the file to upload.
        - mimeType: The MIME type of the file to upload.
        - completion: A completion handler that takes a result containing either the response data or an error.
     
     - Returns: Void
     - Throws: Error if the URL is invalid or the network request fails.
     
     - Usage:
     ```swift
     let parameters = ["param1": "value1", "param2": "value2"]
     let fileData = ... // some file data
     NetworkManager.uploadData(to: "https://api.example.com/upload", parameters: parameters, fileData: fileData, fileName: "file.jpg", mimeType: "image/jpeg") { result in
         switch result {
         case .success(let data):
             print("Upload successful, response data: \(data)")
         case .failure(let error):
             print("Error uploading data: \(error)")
         }
     }
     ```
     
     - Time Complexity: O(n) where n is the size of the data being uploaded
     - Space Complexity: O(n) where n is the size of the data being uploaded
     - Use Cases: Uploading files and data to a REST API
     - Dependencies: Foundation
     - Platform: iOS 7.0+
     */
    static func uploadData(to urlString: String, parameters: [String: String], fileData: Data, fileName: String, mimeType: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let body = NSMutableData()
        for (key, value) in parameters {
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }

        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(fileData)
        body.appendString("\r\n")
        body.appendString("--\(boundary)--\r\n")

        request.httpBody = body as Data

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

// Helper extension to append strings to NSMutableData
private extension NSMutableData {
    func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
