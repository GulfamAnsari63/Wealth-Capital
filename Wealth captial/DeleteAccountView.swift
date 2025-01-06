//
//  DeleteAccountView.swift
//  Wealth captial
//
//
//


import SwiftUI

struct DeleteAccountView: View {
    @State private var showingConfirmation = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 30) {
            // Illustration
            Image(systemName: "trash.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(hex:"#629f42"))
                .padding(.top, 40)

            // Message
            Text("Delete Your Account")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)

            Text("This action will permanently delete your account. All data will be lost. Do you want to continue?")
                .multilineTextAlignment(.center)
                .font(.body)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            // Delete Button
            Button(action: {
                showingConfirmation = true
            }) {
                Text("Delete Account")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex:"#629f42"))
                    .cornerRadius(10)
                    .font(.headline)
            }
            .padding(.horizontal, 20)

            Spacer()
        }
//        .navigationTitle("Delete Account")
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("Are you sure?"),
                message: Text("This action cannot be undone."),
                primaryButton: .destructive(Text("Delete")) {
                    performDeleteAccount()
                },
                secondaryButton: .cancel()
            )
        }
    }

    func performDeleteAccount() {
        // Perform deletion logic here (API call)
        print("Account Deleted!")
        // Navigate back to the root or logout screen
        presentationMode.wrappedValue.dismiss()
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeleteAccountView()
        }
    }
}
