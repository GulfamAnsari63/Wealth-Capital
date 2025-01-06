//
//  ChangePasswordView.swift
//  Wealth captial
//
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Change Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 20)
            Image("Image 9")
//                .padding()
                .scaledToFit()
                .frame(width:80,height:100)
//                .padding()
            
            
//            Spacer()

            // Password Fields
            SecureField("Current Password", text: $currentPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            SecureField("New Password", text: $newPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            // Change Password Button
            Button(action: {
                handleChangePassword()
            }) {
                Text("Change Password")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex:"#629f42"))
                    .cornerRadius(10)
                    .font(.headline)
            }
            .padding(.horizontal)

            Spacer()
        }
//        .navigationTitle("Change Password")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Password Change"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func handleChangePassword() {
        if currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty {
            alertMessage = "Please fill out all fields."
            showAlert = true
            return
        }

        if newPassword != confirmPassword {
            alertMessage = "New passwords do not match."
            showAlert = true
            return
        }

        // Implement password update logic here (API call)
        alertMessage = "Your password has been successfully updated."
        showAlert = true

        // Reset fields
        currentPassword = ""
        newPassword = ""
        confirmPassword = ""
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChangePasswordView()
        }
    }
}
