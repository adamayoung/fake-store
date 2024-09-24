//
//  AccountNavigationView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct AccountNavigationView: View {

    var body: some View {
        NavigationStack {
            AccountDetailsView()
        }
    }

}

#Preview {
    @Previewable @State var accountStore = AccountStore(dependencies: .mock)

    AccountNavigationView()
        .environment(accountStore)
}
