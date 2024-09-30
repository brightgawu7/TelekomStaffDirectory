import SwiftUI

struct VerticalStepperWrapper<Content: View>: View {
    var indicatorColor: Color = .gray
    let content: Content

    /**
     Initializes the `VerticalStepperWrapper` with a given content.

     - Parameter indicatorColor: The color of the indicator line.
     - Parameter content: A closure that provides the view to be displayed in the stepper.
     */
    init(indicatorColor: Color, @ViewBuilder content: () -> Content) {
        self.indicatorColor = indicatorColor
        self.content = content()
    }

    var body: some View {
        ScrollView {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(indicatorColor)
                    .frame(width: 4)

                VStack {
                    content 
                }
            }
            .padding(.leading, 8)
            .clipped()
        }
    }
}

#Preview {
    VerticalStepperWrapper(indicatorColor: .gray) {
            VerticalStepperSection(
                title: "HR",
                content: [
                    VerticalStepperRow( isFirstRow: true) {
                        StaffRowView(staff: staffData.first!)
                    },
                    VerticalStepperRow{
                        StaffRowView(staff: staffData.first!)
                    },
                    VerticalStepperRow {
                        StaffRowView(staff: staffData.first!)
                    }
                ]
            )
        
        VerticalStepperSection(
            title: "Service Center",
            content: [
                VerticalStepperRow {
                    StaffRowView(staff: staffData.first!)
                },
                VerticalStepperRow {
                    StaffRowView(staff: staffData.first!)
                }

            ]
        )
        
            VerticalStepperSection(
            title: "Service Center",
            content: [
                VerticalStepperRow {
                    StaffRowView(staff: staffData.first!)
                },
                VerticalStepperRow {
                    StaffRowView(staff: staffData.first!)
                },
                VerticalStepperRow(isLastRow: true) {
                    StaffRowView(staff: staffData.first!)
                }
            ]
        )
    }
    .padding(.horizontal, 5)
    .environmentObject(StaffSearchViewModel())
}
