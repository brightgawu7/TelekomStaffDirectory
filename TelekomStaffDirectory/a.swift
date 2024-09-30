import SwiftUI

struct ContactListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Title or Header
                Text("Telekom Deutschland GmbH")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.top, 16)
                    .padding(.leading)

                ZStack(alignment: .leading) {
                    // Vertical Line for the entire list
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 2)

                    VStack(alignment: .leading) {
                        // HR Section Header
                        createDepartmentHeader(title: "HR")
                        
                        // Contact Rows
                        createContactRow(name: "Srinivasan Gopalan", position: "Telekom Deutschland GmbH", hasImage: false, isAbove: true)
                        createContactRow(name: "Simone Thiäner", position: "HR", hasImage: true)
                        
                        createDepartmentHeader(title: "HR")
                        createContactRow(name: "Maik Scheminski", position: "HR Transformation & Total Workforce Mgt.", hasImage: false)
                        
                        createDepartmentHeader(title: "HR")
                        createContactRow(name: "Maik Scheminski", position: "HR Transformation & Total Workforce Mgt.", hasImage: false)
                        createContactRow(name: "Babette Bendsen", position: "HR Transformation & Total Workforce Mgt.", hasImage: true, isBelow: true)
                    }
                }
                .padding(.horizontal)
                .clipped()
            }
        }
    }

    private func createDepartmentHeader(title: String) -> some View {
        Text(title)
            .padding(.leading)
    }

    private func createContactRow(name: String, position: String, hasImage: Bool, isAbove: Bool = false, isBelow: Bool = false) -> some View {
        ContactRowView(name: name, position: position, hasImage: hasImage, isAbove: isAbove, isBelow: isBelow)
    }
}

struct ContactRowView: View {
    var name: String
    var position: String
    var hasImage: Bool
    var isAbove: Bool = false
    var isBelow: Bool = false

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // Dot on the vertical line
            ZStack(alignment: .center) {
                if isAbove {
                    createVerticalLine(offset: -50)
                }
                if isBelow {
                    createVerticalLine(offset: 50)
                }

                // Circle views at the mark point
                createContactDot()
            }

            // Contact Row Content
            HStack(alignment: .top) {
                createProfileImage()
                
                // Name and Position
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.headline)
                    Text(position)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 8)

                Spacer()

                // Action Buttons
                createActionButtons()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        .padding(.leading, -7)
    }
    
    private func createVerticalLine(offset: CGFloat) -> some View {
        Rectangle()
            .fill(Color.black)
            .frame(width: 5, height: 100)
            .offset(y: offset)
    }

    private func createContactDot() -> some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 16, height: 16)

            Circle()
                .fill(Color.gray)
                .frame(width: 8, height: 8)
        }
    }

    private func createProfileImage() -> some View {
        let imageName = hasImage ? "person.crop.circle.fill" : "person.crop.circle"
        return Image(systemName: imageName)
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }

    private func createActionButtons() -> some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "phone.fill")
                    .foregroundColor(.pink)
            }

            Button(action: {}) {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding(.leading, 16)
    }
}

#Preview {
    
    ContactListView()
}
