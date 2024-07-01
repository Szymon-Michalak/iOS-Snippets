import Foundation

/// A utility function to check if a given year is a leap year.
/// - Parameter year: The year to check.
/// - Returns: A boolean indicating whether the year is a leap year.
///
/// Usage:
/// ```swift
/// let year = 2024
/// if isLeap(year: year) {
///     print("\(year) is a leap year.")
/// } else {
///     print("\(year) is not a leap year.")
/// }
/// ```
///
/// - Time Complexity: O(1)
/// - Space Complexity: O(1)
/// - Use Cases: Useful for determining if a year is a leap year in date-related calculations.
func isLeap(year: Int) -> Bool {
    if year % 400 == 0 {
        return true
    } else if year % 100 == 0 {
        return false
    } else {
        return year % 4 == 0
    }
}