import SwiftUI

struct StaffSearchView: View {
    @EnvironmentObject var viewModel: StaffSearchViewModel

    init() {
        configureNavigationBarAppearance()
    }

    @FocusState var isFocused: Bool

    var body: some View {
        NavigationStack {
            BackgroundViewWrapper {
                VStack {
                    CustomSearchInput(text: $viewModel.searchText)
                        .focused($isFocused)

                    SearchContentView(
                        staffs: $viewModel.filteredStaffs,

                        searchText: viewModel.searchText, isFocused: isFocused
                    )
                    .padding(.top, 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.horizontal)
                .task {
                    await viewModel.loadAllStaffs()
                }
            }
            .navigationTitle("People@Telekom")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    StaffSearchView()
}
