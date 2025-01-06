//
//  ForgotPasswordViewController.swift
//  Wealth captial
//
//  Created by Arshad on 16/12/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    
    var body: some View {
        VStack {
            HStack{
                Text("Forgot \nPassword")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 30)
                    .multilineTextAlignment(.leading)
            }
                
                Image("Image 6")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, 10)
                
                
                Text("Enter your registered email below to receive password reset instructions")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                //            TextField("Email", text: $email)
                //
                //                .padding()
                //                .background(Color(.systemGray6))
                //                .cornerRadius(8)
                //                .padding(.top, 10)
                VStack(alignment: .leading, spacing: 10) {
                    // Label for the TextField
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                    
                    // TextField
                    TextField("Enter your email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.top, 20)  // Adjust padding for visual balance
                }
                .padding()
                // Send Button
                Button(action: {
                    // Action for sending the reset email
                    sendResetLink()
                }) {
                    Text("Send")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"#629f41"))
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            //        .navigationTitle("Forgot Password")
        }
    
    
    func sendResetLink() {
        // Handle sending the password reset email
        print("Sending reset link to \(email)")
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForgotPasswordView()
        }
    }
}
