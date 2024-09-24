//
//  AccountDetailsView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import SwiftUI

struct AccountDetailsView: View {

    @Environment(AccountStore.self)
    private var accountStore: AccountStore

    @State private var isSignInPresented = false

    var body: some View {
        List {
            if let user = accountStore.user {
                Section {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                            .padding(.trailing)
                            .foregroundStyle(.secondary)

                        VStack(alignment: .leading) {
                            Text(verbatim: user.fullName)
                                .font(.title)

                            Text(verbatim: user.email)
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                Section("CONTACT_INFORMATION") {
                    LabeledContent("ADDRESS") {
                        Text(verbatim: user.address.formatted())
                    }

                    LabeledContent("PHONE_NUMBER") {
                        Text(verbatim: "\(user.phoneNumber)")
                    }
                }

                Section {
                    HStack {
                        Spacer()
                        Button("SIGN_OUT") {
                            signOut()
                        }
                        .foregroundStyle(.red)
                        Spacer()
                    }
                }
            }
        }
        .overlay {
            if !accountStore.isLoggedIn {
                ContentUnavailableView {
                    Text("NOT_SIGNED_IN")
                } description: {
                    Text("YOU_NEED_TO_SIGN_IN_FIRST")
                } actions: {
                    Button("SIGN_IN") {
                        isSignInPresented = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.headline)
                }
            }
        }
        .sheet(isPresented: $isSignInPresented) {
            NavigationStack {
                SignInView()
            }
        }
        .navigationTitle("ACCOUNT")
    }

    private func signOut() {
        accountStore.signOut()
    }

}

#Preview("Signed In") {
    @Previewable @State var accountStore = AccountStore(
        user: User.mock,
        accessToken: AccessToken.mock,
        dependencies: .mock
    )

    NavigationStack {
        AccountDetailsView()
    }
    .environment(accountStore)
}

#Preview("Signed Out") {
    @Previewable @State var accountStore = AccountStore(
        user: nil,
        accessToken: nil,
        dependencies: .mock
    )

    NavigationStack {
        AccountDetailsView()
    }
    .environment(accountStore)
}
