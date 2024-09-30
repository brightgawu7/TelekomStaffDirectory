// Extension to apply shared styling to icons

import SwiftUICore

extension Image {
    func iconStyle(size: CGFloat) -> some View {
        frame(width: size, height: size)
//            .fontWeight(.bold)
            .foregroundStyle(Color(.defaultWhite))
    }
}
