import SwiftUI

/// A custom environment key for setting and getting a caption background color.
private struct CaptionBackgroundColorKey: EnvironmentKey {
    static let defaultValue = Color(.secondarySystemBackground)
}

extension EnvironmentValues {
    /// The custom caption background color.
    var captionBackgroundColor: Color {
        get { self[CaptionBackgroundColorKey.self] }
        set { self[CaptionBackgroundColorKey.self] = newValue }
    }
}

extension View {
    /**
     Sets the caption background color for the environment.
     
     - Parameter color: The color to set as the caption background color.
     - Returns: A view with the modified environment value.
     
     - Usage:
     ```swift
     Text("Hello, World!")
         .captionBackgroundColor(.blue)
     ```
     
     - Time Complexity: O(1)
     - Space Complexity: O(1)
     - Use Cases: Setting a custom background color in the environment for consistent use across views.
     - Dependencies: SwiftUI
     - Swift Version: 5.3+
     - Platform: iOS 14.0+
     */
    func captionBackgroundColor(_ color: Color) -> some View {
        environment(\.captionBackgroundColor, color)
    }
}

struct ContentView: View {
    @Environment(\.captionBackgroundColor) var captionBackgroundColor
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(captionBackgroundColor)
            
            Text("Another text")
                .padding()
                .background(captionBackgroundColor)
        }
        .captionBackgroundColor(.blue)
    }
}

// MARK: - Usage Example

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
