import SwiftUI

/// A button that sends an email when pressed, with dynamic disabling based on the availability of the email address.
struct EmailActionButton: View {
    /// The optional email address to send an email to when the button is pressed.
    var emailAddress: String?

    /**
     A Boolean indicating whether the button is disabled.

     The button is automatically disabled if the email address is nil or empty.
     */
    var isButtonDisabled: Bool {
        emailAddress?.isEmpty ?? true
    }

    var body: some View {
        // Circular button that performs the email sending action when tapped.
        CircularIconButton(
            systemIconName: "envelope",
            backgroundColor: .init(.defaultWhite),
            iconColor: .init(.black),
            isButtonDisabled: isButtonDisabled,
            action: {
                // Use the helper to send the email.
                EmailSendingHelper.sendEmail(to: emailAddress)
            }
        )
    }
}

#Preview {
    VStack {
        // Preview with a valid email address (button enabled)
        EmailActionButton(emailAddress: "example@example.com")

        // Preview with no email address (button disabled)
        EmailActionButton(emailAddress: nil)
    }
}
