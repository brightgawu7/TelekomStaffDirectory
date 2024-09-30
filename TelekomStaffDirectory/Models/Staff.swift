import Foundation

struct Staff: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let location: String
    let team: Team
    let isTeamInternal: Bool
    let address: String
    let image: String?
    let email: String?
    let phone: String?
}
