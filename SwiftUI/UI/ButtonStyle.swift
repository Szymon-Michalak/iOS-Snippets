import SwiftUI

/// A custom button style that adds padding, a background, and changes opacity when pressed.
struct ButtonStyle: ButtonStyle {
    
    /**
     Creates the body of a button using the given configuration.
     
     - Parameter configuration: The properties of the button.
     - Returns: A view that represents the body of a button.
     
     - Usage:
     ```swift
     Button(action: { print("Pressed") }) {
         Label("Press Me", systemImage: "star")
     }
     .buttonStyle(ButtonStyle())
     ```
     
     - Time Complexity: O(1)
     - Space Complexity: O(1)
     - Use Cases: Customizing the appearance of buttons in SwiftUI.
     - Dependencies: SwiftUI
     - Swift Version: 5.3+
     - Platform: iOS 14.0+
     */
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.quaternary, in: Capsule())
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: { print("Pressed") }) {
            Label("Press Me", systemImage: "star")
        }
        .buttonStyle(ButtonStyle())
    }
}
