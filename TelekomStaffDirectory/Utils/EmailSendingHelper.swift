import UIKit

/// A utility helper responsible for handling email sending functionality.
enum EmailSendingHelper {
    /**
     Attempts to compose an email to the provided email address using the system's mail client.

     This method constructs a `mailto:` URL from the email address and attempts to open it
     using `UIApplication`. It verifies if the email address is valid and if the mail client can be opened.

     - Parameter emailAddress: The email address to compose the email to, which can be optional.
     - Note: The email address should be in a valid format for it to be usable.
     */
    static func sendEmail(to emailAddress: String?) {
        guard let emailAddress = emailAddress, !emailAddress.isEmpty else {
            return
        }

        // Create a URL with the `mailto:` scheme
        guard let emailURL = URL(string: "mailto:\(emailAddress)"),
              UIApplication.shared.canOpenURL(emailURL)
        else {
            print("Invalid email address or unable to open email client")
            return
        }

        // Open the URL to initiate composing the email
        UIApplication.shared.open(emailURL)
    }
}
