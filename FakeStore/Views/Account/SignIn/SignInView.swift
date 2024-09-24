//
//  SignInView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct SignInView: View {

    @State private var username = "johnd"
    @State private var password = "m38rmF$"

    @State private var isSignInButtonEnabled = true
    @State private var isSigningIn = false

    @Environment(AccountStore.self)
    private var accountStore: AccountStore

    @Environment(\.presentationMode)
    private var presentationMode

    var body: some View {
        Form {
            Section {
                TextField("USERNAME", text: $username)
                SecureField("PASSWORD", text: $password)
            }

            Section {
                HStack {
                    Spacer()
                    Button("SIGN_IN") {
                        signIn()
                    }
                    .opacity(isSigningIn ? 0 : 1)
                    .disabled(!isSignInButtonEnabled)
                    .overlay {
                        if isSigningIn {
                            ProgressView()
                                .progressViewStyle(.circular)
                        }
                    }
                    Spacer()
                }
            }
        }
        .onChange(of: [username, password]) { _, newValue in
            isSignInButtonEnabled = !newValue[0].isEmpty && !newValue[1].isEmpty
        }
        .navigationTitle("SIGN_IN")
    }

    private func signIn() {
        isSigningIn = true
        Task {
            do {
                try await accountStore.signIn(username: username, password: password)
            } catch let error {
                print("Error: \(error.localizedDescription)")
                isSigningIn = false
                return
            }

            presentationMode.wrappedValue.dismiss()
        }
    }

}

#Preview {
    @Previewable @State var accountStore = AccountStore(
        user: nil,
        accessToken: nil,
        dependencies: .mock
    )

    NavigationStack {
        SignInView()
    }
    .environment(accountStore)
}
