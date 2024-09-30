/**
 A button that clears the search text when tapped.
 */

import SwiftUI
import SwiftUICore

struct ClearButton: View {
    var isVisible: Bool
    var action: () -> Void
    var size: CGFloat = 15

    var body: some View {
        Button(action: action) {
            if isVisible {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .iconStyle(size: size)
            }
        }
    }
}

#Preview {
    ClearButton(isVisible: true) {}
}
