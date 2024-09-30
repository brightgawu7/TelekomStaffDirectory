import SwiftUI

/**
 A view representing a row in a vertical stepper, which includes an optional vertical line
 and a contact dot.

 - Parameters:
   - Content: The type of the content view that will be displayed within the stepper row.
 */
struct VerticalStepperRow<Content: View>: View {
    /// The color of the vertical indicator line.
    var indicatorColor: Color = .gray
    
    /// The height of the row.
    var rowHeight: CGFloat = 110
    
    /// Indicates if this is the first row in the stepper.
    var isFirstRow: Bool = false
    
    /// Indicates if this is the last row in the stepper.
    var isLastRow: Bool = false
    
    /// Closure for customizable content that will be displayed in the row.
    var content: () -> Content
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            ZStack(alignment: .center) {
                // Create vertical line at the top if this is the first row
                if isFirstRow {
                    createVerticalLine(offset: -(rowHeight / 2))
                }
                // Create vertical line at the bottom if this is the last row
                if isLastRow {
                    createVerticalLine(offset: (rowHeight / 2))
                }
                
                // Create the contact dot at the center of the stepper row
                createContactDot()
            }
            
            // Use the closure to display the custom content
            content()
                .frame(minHeight: rowHeight)
        }
        .padding(.leading, -6) // Adjust the leading padding
    }
    
    /**
     Creates a vertical line with the specified offset.
     
     - Parameter offset: The vertical offset for positioning the line.
     - Returns: A view representing the vertical line.
     */
    private func createVerticalLine(offset: CGFloat) -> some View {
        Rectangle()
            .fill(.black) // Use the provided indicator color
            .frame(width: 5, height: rowHeight) // Set the width and height of the line
            .offset(y: offset) // Apply the vertical offset
    }
    
    /**
     Creates a contact dot with an outer circle and an inner circle.
     
     - Returns: A view representing the contact dot.
     */
    private func createContactDot() -> some View {
        ZStack {
            Circle()
                .fill(Color.black) // Outer circle color
                .frame(width: 16, height: 16) // Size of the outer circle
            Circle()
                .fill(Color.gray) // Inner circle color
                .frame(width: 8, height: 8) // Size of the inner circle
        }
    }
}

#Preview {
    VerticalStepperRow {
    
        StaffRowView(staff: staffData.first!)
    }
    .padding()
    .environmentObject(StaffSearchViewModel())
}
