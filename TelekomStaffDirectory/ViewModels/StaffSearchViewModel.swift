import Combine
import Foundation
import SwiftUICore

final class StaffManager {
    func getAllStaffs() async throws -> [Staff] {
        Bundle.main.decode("staffs.json")
    }
}

@MainActor
final class StaffSearchViewModel: ObservableObject {
    @Published var staffs: [Staff] = []
    @Published var filteredStaffs: [Staff] = []
    @Published var searchText: String = ""

    let manager = StaffManager()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.filterStaffs(searchText: searchText)
            }
            .store(in: &cancellables)
    }

    private func filterStaffs(searchText: String) {
        guard !searchText.isEmpty else {
            filteredStaffs = []
            return
        }

        filteredStaffs = staffs.filter { staff in

            staff.name.lowercased().contains(searchText.lowercased())
        }
    }

    func searchStaffById(_ id: UUID) async -> Staff? {
        return staffs.first { staff in
            staff.id == id
        }
    }

    func loadAllStaffs() async {
        do {
            staffs = try await manager.getAllStaffs()
        } catch {}
    }
}
