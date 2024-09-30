

import SwiftUI

struct SearchContentView: View {
    @Binding var staffs: [Staff]

    @StateObject private var recentSearchesViewModel = RecentSearchesViewModel()

    var searchText: String
    var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading) {
            if searchText.isEmpty {
                if recentSearchesViewModel.recentSearchesList.count > 0 && isFocused {
                    RecentSearchesView(viewModel: recentSearchesViewModel)
                } else {
                    PlaceholderTextView()
                }
            }

            else if staffs.isEmpty {
                PlaceholderTextView(placeholderText: "No employees found for \"\(searchText)\".")
            } else {
                ContactsListView(staffs: $staffs)
            }
        }
        .navigationDestination(for: Staff.self) { staff in
            StaffDetailView(staffId: staff.id)
                .onAppear {
                    recentSearchesViewModel.addRecentSearch(id: staff.id, name: staff.name)
                }
        }
        .navigationDestination(for: RecentSearchItem.self) { searchItem in
            StaffDetailView(staffId: searchItem.id)
                .onAppear {
                    recentSearchesViewModel.addRecentSearch(id: searchItem.id, name: searchItem.name)
                }
        }
    }
}

#Preview {
    SearchContentView(staffs: .constant([]), searchText: "a", isFocused: false)
        .padding()
}
