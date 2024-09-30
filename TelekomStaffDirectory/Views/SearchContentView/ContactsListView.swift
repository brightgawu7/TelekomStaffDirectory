//
//  ContactsListView.swift
//  TelekomStaffDirectory
//
//  Created by AMALITECH-PC-105889 on 9/25/24.
//

import SwiftUI

struct ContactsListView: View {
    @Binding var staffs: [Staff]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Contacts")
                .font(.headline)
                .foregroundStyle(Color(.textDarkLight))

            ScrollView {
                VStack(spacing: 13) {
                    ForEach(staffs) { staff in

                        NavigationLink(value: staff) {
                            StaffRowView(staff: staff)
                        }
                    }
                }
            }
        }
    }
}

// #Preview {
//    ContactsListView(staffs: .constant([]))
//        .padding()
// }
