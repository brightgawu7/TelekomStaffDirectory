import SwiftUI

/**
 A view wrapper that applies a dark gray background to the content it wraps.

 This wrapper uses a `ZStack` to layer a background color and its child view.

 - Parameter Content: A generic view type that will be wrapped by the background.
 */
struct BackgroundViewWrapper<Content: View>: View {
    /// The content that will be displayed on top of the background.
    let content: Content

    /**
     Initializes the `BackgroundViewWrapper` with a given content.

     - Parameter content: A closure that provides the view to be displayed on top of the background.
     */
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    /**
     The body of the view, which contains a dark gray background and the content passed to it.
     */
    var body: some View {
        ZStack {
            // Sets the background color to a custom dark gray color and ignores safe area.
            Color(.grayDark)
                .ignoresSafeArea()

            // Displays the content passed into the view.
            content
        }
    }
}

#Preview {
    BackgroundViewWrapper {
        Text("Hello World")
            .font(.headline)
            .foregroundStyle(.defaultWhite)
    }
}
