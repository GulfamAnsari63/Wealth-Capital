//
//  CreatePasswordView.swift
//  Wealth captial
//
//  Created by Arshad on 16/12/24.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create New\nPassword")
                .font(.title)
                .bold()
                .padding(.top, 40)
            
            Text("Your new password must be different from the previously used passwords")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.vertical, 10)
            
            Text("Password")
                .font(.headline)
                .padding(.top, 10)
            
            SecureField("Enter Password", text: $newPassword)
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                .padding(.bottom, 5)
            
            Text("Must be at least 8 characters")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("Confirm Password")
                .font(.headline)
                .padding(.top, 10)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                .padding(.bottom, 5)
            
            Text("Both passwords must match")
                .font(.caption)
                .foregroundColor(.gray)
            
            Button(action: {
            }) {
                Text("Create Password")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex:"#629f42"))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
    }
}

#Preview{
    CreatePasswordView()
}
