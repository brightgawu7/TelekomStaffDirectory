
import SwiftUI

struct StaffRowView: View {
    @State var staff: Staff
    @EnvironmentObject var viewModel: StaffSearchViewModel

    var body: some View {
        HStack {
            PhotoAvatar(imageURL: URL(string: staff.image ?? ""))
            Spacer()
            VStack(alignment: .leading, spacing: 2) {
                Text(makeHighlightedText(fullText: staff.name, highlighted: viewModel.searchText))
                    .font(.system(size: 20))
                Text(staff.team.name)
                    .font(.system(size: 14))
            }.frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundStyle(.textDarkLight)
            Spacer()

            HStack(spacing: 5) {
                PhoneActionButton(phoneNumber: staff.phone)
                EmailActionButton(emailAddress: staff.email)
            }
        }
        .padding(15)
        .background(Color(.grayDarkLight))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    func makeHighlightedText(fullText: String, highlighted: String) -> AttributedString {
        var attributedString = AttributedString(fullText)

        let lowercasedFullText = fullText.lowercased()
        let lowercasedHighlighted = highlighted.lowercased()

        if let range = lowercasedFullText.range(of: lowercasedHighlighted) {
            if let startIndex = attributedString.range(of: fullText[range.lowerBound ..< range.upperBound]) {
                attributedString[startIndex].foregroundColor = .defaultWhite
                attributedString[startIndex].font = .boldSystemFont(ofSize: 18)
            }
        }

        return attributedString
    }
}

// #Preview {
//    StaffRowView(staff: staffData.first!)
//        .padding()
// }
