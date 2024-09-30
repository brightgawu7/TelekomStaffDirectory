

import SwiftUI

struct RecentSearchesView: View {
    @StateObject var viewModel: RecentSearchesViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Recent searches")
                .font(.headline)
                .foregroundStyle(Color(.textDarkLight))

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.recentSearchesList) { recentSearch in

                        NavigationLink(value: recentSearch) {
                            RecentSearchRow(searchItem: recentSearch) {
                                viewModel.removeRecentSearch(id: recentSearch.id)
                            }
                        }

                        Divider()
                            .background(Color(.defaultWhite).opacity(0.5))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// #Preview {
//    RecentSearchesView()
//        .padding()
// }
