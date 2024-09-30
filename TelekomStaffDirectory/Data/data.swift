import Foundation
var staffData:[Staff] = [
    Staff(
        id: UUID(),
        name: "Jonathan Alexander Morales",
        location: "San Francisco, California",
        team: Team(
            id: UUID(),
            name: "Enterprise Innovation Team",
            isInternal: true
        ),
        isTeamInternal: true,
        address: "1234 Market Street, San Francisco, CA 94103",
        image: "https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg",
        email: "jonathan.morales@company.com",
        phone: "+1-234-567-8901"
    )
]
