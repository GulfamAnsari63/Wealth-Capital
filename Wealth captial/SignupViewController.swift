//
//  SignupViewController.swift
//  Wealth captial
//
//  Created by Arshad on 16/12/24.
//
//import SwiftUI
//
//struct SignupView: View {
//    @State private var employeeID = ""
//    @State private var name = ""
//    @State private var email = ""
//    @State private var mobileNumber = ""
//    @State private var password = ""
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(spacing: 10) {
//            
//                    Text("Create\nAccount")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.horizontal)
//                    Image("Logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 120, height: 80)
//                    
//                    // Employee ID
//                    CustomTextField(
//                        text: $employeeID,
//                        label: "Employee ID",
//                        placeholder: "Enter Employee ID"
//                    )
//                    
//                    // Name
//                    CustomTextField(
//                        text: $name,
//                        label: "Name",
//                        placeholder: "Enter Name"
//                    )
//                    
//                    // Email
//                    CustomTextField(
//                        text: $email,
//                        label: "Email",
//                        placeholder: "Enter Email"
//                    )
//                    
//                    // Mobile Number
//                    CustomTextField(
//                        text: $mobileNumber,
//                        label: "Mobile Number",
//                        placeholder: "Enter Mobile Number"
//                    )
//                    
//                    // Password
//                    CustomTextField(
//                        text: $password,
//                        label: "Password",
//                        placeholder: "Enter Password",
//                        isSecure: true
//                    )
//
//                    // Signup Button
//                    Button(action: {
//                        // Handle signup action here
//                    }) {
//                        Text("Signup")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color(hex:"#629f41"))
//                            .cornerRadius(8)
//                    }
//                    
//                    // Already have an account
//                    HStack {
//                        Text("Already have an account?")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                        
//                        NavigationLink(destination: LoginView()) {
//                            Text("Sign in")
//                                .font(.subheadline)
//                                .background(Color(hex:"#629f41"))
//                        }
//                    }
//                    .padding(.top, 10)
//                }
//                .padding(.horizontal)
//            }
////            .navigationTitle("Signup")
////            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//// Custom TextField view for reuse
//struct CustomTextField: View {
//    @Binding var text: String
//    var label: String
//    var placeholder: String
//    var isSecure: Bool = false
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            Text(label)
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            
//            if isSecure {
//                SecureField(placeholder, text: $text)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(8)
//            } else {
//                TextField(placeholder, text: $text)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(8)
//            }
//        }
//    }
//}

import SwiftUI

struct SignupView: View {
    @State private var employeeID = ""
    @State private var name = ""
    @State private var email = ""
    @State private var mobileNumber = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
            
                    Text("Create\nAccount")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Image("signup")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .scaledToFit()
                        .frame(width: 150.0, height: 150.0)
                    
                   

                    // Employee ID
                    CustomTextField(
                        text: $employeeID,
                        label: "Employee ID",
                        placeholder: "Enter Employee ID"
                    )
                    
                    // Name
                    CustomTextField(
                        text: $name,
                        label: "Name",
                        placeholder: "Enter Name"
                    )
                    
                    // Email
                    CustomTextField(
                        text: $email,
                        label: "Email",
                        placeholder: "Enter Email"
                    )
                    
                    // Mobile Number
                    CustomTextField(
                        text: $mobileNumber,
                        label: "Mobile Number",
                        placeholder: "Enter Mobile Number"
                    )
                    
                    // Password
                    CustomTextField(
                        text: $password,
                        label: "Password",
                        placeholder: "Enter Password",
                        isSecure: true
                    )

                    // Signup Button
                    Button(action: {
                        // Handle signup action here
                    }) {
                        Text("Signup")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.424, green: 0.6431372549019608, blue: 0.2980392156862745))
                            .cornerRadius(8)
                    }
                    
                    // Already have an account
                    HStack {
                        Text("Already have an account?")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Sign in")
                                .font(.subheadline)
                                .background(Color("##629f42"))
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
            }
//            .navigationTitle("Signup")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Custom TextField view for reuse
struct CustomTextField: View {
    @Binding var text: String
    var label: String
    var placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}


