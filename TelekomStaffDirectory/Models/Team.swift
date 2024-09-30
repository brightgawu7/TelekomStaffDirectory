
import Foundation

struct Team: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let isInternal: Bool
}
