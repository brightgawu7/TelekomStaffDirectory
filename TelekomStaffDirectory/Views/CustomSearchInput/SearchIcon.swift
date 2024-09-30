/**
 A view that displays a magnifying glass icon for search functionality.
 */

import SwiftUI
import SwiftUICore

struct SearchIcon: View {
    var size: CGFloat = 15

    var body: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .iconStyle(size: size)
    }
}

#Preview {
    SearchIcon()
}
