import SwiftUI

extension Shape {
    
    /// Fills the shape with the specified fill content and also applies a stroke with the given style.
    ///
    /// - Parameters:
    ///   - fillContent: The style to use when filling the shape.
    ///   - stroke: The stroke style to use when stroking the shape.
    /// - Returns: A view that fills and strokes the shape.
    ///
    /// - Usage:
    /// ```swift
    /// Circle()
    ///     .fill(Color.red, stroke: StrokeStyle(lineWidth: 2, dash: [5]))
    /// ```
    ///
    /// - Complexity: O(1)
    public func fill<S: ShapeStyle>(
        _ fillContent: S,
        stroke: StrokeStyle
    ) -> some View {
        ZStack {
            self.fill(fillContent)
            self.stroke(style: stroke)
        }
    }
}
