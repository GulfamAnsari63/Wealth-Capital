//
//  LogoutView.swift
//  Wealth captial
//
//  Created by Arshad on 18/12/24.
//


import SwiftUI

struct LogoutView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 30) {
            // Title
            Text("You are\nLogged out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 40)

            // Logout Illustration
            Image("Image 1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 150)
                .foregroundColor(Color.green)
//            Spacer()

            // Message
            Text("You are logged out. To see your account, please sign in. Don’t have an account? Sign up to create a new one.")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            // Buttons
            HStack(spacing: 20) {
                Button(action: {
                    // Navigate to Sign In
                    presentationMode.wrappedValue.dismiss()
                }) {
                    NavigationLink(destination:LoginView()){
                        Text("Sign In")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex:"#629f42"))
                            .cornerRadius(10)
                    }
                }
                Button(action: {
                    // Navigate to Sign Up
                    presentationMode.wrappedValue.dismiss()
                }) {
                    NavigationLink(destination:SignupView()){
                        Text("Sign Up")
                            .foregroundColor(Color(hex:"#629f42"))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex:"#629f42"), lineWidth: 2)
                            )
                    }
                }
            }
            .padding(.horizontal)

            Spacer()
        }
//        .navigationTitle("Logout")
    }
}

struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LogoutView()
        }
    }
}
