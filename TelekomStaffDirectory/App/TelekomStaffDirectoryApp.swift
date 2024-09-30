import SwiftUI

/**
 The entry point of the Telekom Staff Directory application.
 */
@main
struct TelekomStaffDirectoryApp: App {
    // The view model for staff search.
    @StateObject private var staffViewModel = StaffSearchViewModel()

    var body: some Scene {
        WindowGroup {
            // Displays the main content view of the app.
            StaffSearchView()
                .environmentObject(staffViewModel)
        }
    }
}
