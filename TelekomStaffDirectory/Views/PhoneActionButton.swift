import SwiftUI

/// A button that dials a phone number when pressed, with dynamic disabling based on the availability of the number.
struct PhoneActionButton: View {
    /// The optional phone number to dial when the button is pressed.
    var phoneNumber: String?

    /// A Boolean indicating whether the button is disabled.
    /// The button is automatically disabled if the phone number
    /// is nil or empty.
    var isButtonDisabled: Bool {
        phoneNumber?.isEmpty ?? true
    }

    var body: some View {
        // Circular button that performs the phone dialing action when tapped.
        CircularIconButton(
            systemIconName: "phone.fill",
            backgroundColor: .init(.purpleRed),
            iconColor: .init(.defaultWhite),
            isButtonDisabled: isButtonDisabled,
            action: {
                // Use the helper to dial the phone number.
                PhoneDialingHelper.dial(phoneNumber: phoneNumber)
            }
        )
    }
}

#Preview {
    VStack {
        // Preview with a valid phone number (button enabled)
        PhoneActionButton(phoneNumber: "+1234567890")

        // Preview with no phone number (button disabled)
        PhoneActionButton(phoneNumber: nil)
    }
}
