import SwiftUI

/**
 A customizable circular button view with an icon.

 This button can be customized by providing a background
 color, icon color, an optional disabled state, and an action
 to perform when pressed.
 */
struct CircularIconButton: View {
    /// The system icon name for the button's icon.
    var systemIconName: String

    /// The background color of the button when it is enabled.
    var backgroundColor: Color = .init(.purpleRed)

    /// The color of the icon in the button.
    var iconColor: Color = .init(.defaultWhite)

    /// A Boolean indicating whether the button is disabled.
    var isButtonDisabled: Bool = false

    /// The action to perform when the button is pressed. Defaults to nil if no action is provided.
    var action: (() -> Void)?

    var body: some View {
        Button(action: {
            // Call the action closure if it exists
            action?()
        }, label: {
            // Configure the button's icon and appearance
            Image(systemName: systemIconName)
                .frame(width: 15, height: 15)
                .foregroundColor(iconColor)
                .padding(12)
                .background(isButtonDisabled ? Color(.surfaceDisabled) : backgroundColor)
                .clipShape(Circle())
        })
        // Disable the button if `isButtonDisabled` is true
        .disabled(isButtonDisabled)
    }
}

#Preview {
    CircularIconButton(
        systemIconName: "arrow.2.circlepath.circle",
        backgroundColor: .init(.defaultWhite),
        iconColor: .black,
        action: {
            print("Button pressed!")
        }
    )
}
