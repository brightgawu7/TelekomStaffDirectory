import SwiftUI

class RecentSearchesViewModel: ObservableObject {
    @AppStorage("RecentSearches") private var recentSearchesStorage: Data = .init()

    @Published var recentSearchesList: [RecentSearchItem] = []

    init() {
        loadRecentSearches()
    }

    func loadRecentSearches() {
        if let decodedList = try? JSONDecoder().decode([RecentSearchItem].self, from: recentSearchesStorage) {
            recentSearchesList = decodedList
        }
    }

    func addRecentSearch(id: UUID, name: String) {
        let newSearchItem = RecentSearchItem(id: id, name: name)

        recentSearchesList.removeAll(where: { $0.id == id })

        recentSearchesList.insert(newSearchItem, at: 0)

        if recentSearchesList.count > 5 {
            recentSearchesList = Array(recentSearchesList.prefix(5))
        }

        saveRecentSearches()
    }

    func removeRecentSearch(id: UUID) {
        recentSearchesList.removeAll(where: { $0.id == id })
        saveRecentSearches()
    }

    func clearAllSearches() {
        recentSearchesList.removeAll()
        saveRecentSearches()
    }

    private func saveRecentSearches() {
        if let encodedList = try? JSONEncoder().encode(recentSearchesList) {
            recentSearchesStorage = encodedList
        }
    }
}
