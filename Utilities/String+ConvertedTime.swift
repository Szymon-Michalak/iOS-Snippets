import Foundation

extension String {
    
    /// Converts a time string to PST format if the current locale is in the PST timezone.
    ///
    /// - Returns: The converted time string if in PST locale, otherwise the original string.
    ///
    /// - Usage:
    /// ```swift
    /// let timeString = "14:30"
    /// let convertedTime = timeString.convertedToPSTTimeIfNeeded()
    /// print(convertedTime) // "2:30 PM" if in PST locale
    /// ```
    func convertedToPSTTimeIfNeeded() -> String {
        guard isCurrentLocalePST() else { return self }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "PST")

        guard let date = dateFormatter.date(from: self) else { return self }
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = TimeZone(abbreviation: "PST")
        return dateFormatter.string(from: date)
    }
    
    /// Checks if the current locale uses a 12-hour format which is common in PST timezone.
    ///
    /// - Returns: `true` if the current locale uses a 12-hour format, otherwise `false`.
    private func isCurrentLocalePST() -> Bool {
        guard let formatString = DateFormatter.dateFormat(
            fromTemplate: "j",
            options: 0,
            locale: Locale.current
        ) else {
            return false
        }
        return formatString.contains("a")
    }
}
