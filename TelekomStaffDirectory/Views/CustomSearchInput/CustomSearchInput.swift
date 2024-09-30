import SwiftUI

/**
 A custom search input view that includes a magnifying glass icon, a text field for input, and a clear button.

 The view provides a styled search bar that allows users to input their search queries and clear the input easily.
 */
struct CustomSearchInput: View {
    /// The text entered in the search field.
    @Binding var text: String

    /// Focus state for the text field.
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 15) {
            // Search icon
            SearchIcon()

            // Search text field
            TextField("Search", text: $text)
                .font(.headline)
                .foregroundStyle(Color(.defaultWhite))
                .keyboardType(.emailAddress)
                .focused($isFocused)

            // Clear button
            ClearButton(isVisible: !text.isEmpty) {
                text = ""
                isFocused = false
            }
        }
        .frame(maxWidth: .infinity)
        .padding(15)
        .background(Color(.grayDarkLight))
        .cornerRadius(30)
    }
}

#Preview {}
