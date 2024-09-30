
import SwiftUI

struct StaffDetailView: View {
    @EnvironmentObject var viewModel: StaffSearchViewModel
    @State private var staff: Staff?

    var staffId: UUID

    var body: some View {
        NavigationView {
            BackgroundViewWrapper {
                VStack(spacing: 20) {
                    PhotoAvatar(imageURL: URL(string: staff?.image ?? ""), size: 200)

                    Text(staff?.name ?? "")
                        .foregroundStyle(.defaultWhite)
                        .font(.system(size: 20, weight: .bold))

                    VStack {
                        Text(staff?.location ?? "")
                        Text(staff?.team.name ?? "")
                    }
                    .font(.system(size: 20))
                    .foregroundStyle(.textDarkLight)

                    Text(staff?.address ?? "")
//                        .frame(width: 150)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.textDarkLight)

                    VStack {
                        Text("Mobile \(staff?.phone ?? "")")
                        Text("\(staff?.email ?? "")")
                    }
                    .font(.system(size: 20))
                    .foregroundStyle(.defaultWhite)

                    HStack(spacing: 2) {
                        PhoneActionButton(phoneNumber: staff?.phone)
                        EmailActionButton(emailAddress: staff?.email)
                    }

                    Spacer()
                }
                .task {
                    staff = await viewModel.searchStaffById(staffId)
                }
            }
        }
    }
}

// #Preview {
//    StaffDetailView(staffId: staffData.first!.id)
// }
