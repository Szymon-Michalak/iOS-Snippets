import UIKit

extension String {
    
    /// Calculates the width of the string using the specified font.
    ///
    /// - Parameter font: The font to use for calculating the string width.
    /// - Returns: The width of the string when rendered with the specified font.
    ///
    /// - Usage:
    /// ```swift
    /// let myString = "Hello, World!"
    /// let font = UIFont.systemFont(ofSize: 16)
    /// let width = myString.width(using: font)
    /// print(width)
    /// ```
    ///
    /// - Complexity: O(1)
    func width(using font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
