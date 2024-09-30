import UIKit

/// A utility helper responsible for handling phone dialing functionality.
enum PhoneDialingHelper {
    /**
     Attempts to dial the provided phone number using the system's phone dialer.

     This method constructs a `tel://` URL from the phone number and attempts to open it
     using `UIApplication`. It verifies if the phone number is valid and if the dialer can
     be opened.

     - Parameter phoneNumber: The phone number to dial, which can be optional.
     - Note: The phone number should be in a valid format for it to be dialable.
     */
    static func dial(phoneNumber: String?) {
        guard let phoneNumber = phoneNumber, !phoneNumber.isEmpty else {
            return
        }

        // Clean the phone number
        let cleanedPhoneNumber = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)

        // Check for a valid phone number length
        guard cleanedPhoneNumber.count >= 10 else {
            return
        }

        // Create a URL with the `tel://` scheme
        guard let phoneURL = URL(string: "tel://\(cleanedPhoneNumber)"),
              UIApplication.shared.canOpenURL(phoneURL)
        else {
            print("Invalid phone number or unable to open dialer")
            return
        }

        // Open the URL to initiate the dial
        UIApplication.shared.open(phoneURL)
    }
}
