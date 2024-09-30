

import SwiftUI

struct RecentSearchRow: View {
    let searchItem: RecentSearchItem
    let clearAction: (() -> Void)?

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "clock")
                .foregroundColor(Color(.defaultWhite))

            Text(searchItem.name)

            Spacer()

            Button(action: {
                clearAction?()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.defaultWhite))
            }
        }
        .font(.system(size: 18, weight: .light))
        .foregroundStyle(.defaultWhite)
        .multilineTextAlignment(.leading)
    }
}

// #Preview {
//    RecentSearchRow(searchText: "Bright Edem Gawu", clearAction: nil)
//        .padding()
// }
