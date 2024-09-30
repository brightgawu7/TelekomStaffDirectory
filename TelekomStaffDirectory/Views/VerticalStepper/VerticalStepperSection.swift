import SwiftUI

struct VerticalStepperSection<Content: View>: View {
    var title: String
    var indicatorColor: Color = .gray
    
    // Accept an array of VerticalStepperRow with a specific content type
    let content: [VerticalStepperRow<Content>]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.textDarkLight)
                .padding(.leading, 16)
                .padding(.vertical, 8)

            VStack {
                ForEach(content.indices, id: \.self) { index in
                    content[index]
                }
            }
        }
    }
}

#Preview {
    VerticalStepperSection(
        title: "Hello",
        content: [
            VerticalStepperRow( isFirstRow: true) {
                StaffRowView(staff: staffData.first!)
            },
            VerticalStepperRow {
                StaffRowView(staff: staffData.first!)
            },
            VerticalStepperRow {
                StaffRowView(staff: staffData.first!)
            },
            VerticalStepperRow( isLastRow: true) {
                StaffRowView(staff: staffData.first!)
            }
        ]
    )
    .padding(.leading, 20)
    .environmentObject(StaffSearchViewModel())
}
