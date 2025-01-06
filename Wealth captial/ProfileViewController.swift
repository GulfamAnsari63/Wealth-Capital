////
////  ProfileViewController.swift
////  Wealth captial
////
////  Created by Arshad on 17/12/24.
////
//import SwiftUI
//
//struct ProfileView: View {
//    let details = [
//        ("Employee ID/No","456"),
//        ("Full Name","User"),
//        ("Email","useremail@test.com"),
//        ("Joining Date","01/05/2024"),
//        ("Phone Num","1234567890"),
//        ("Designation",""),
//        ("Occupation","")
//    ]
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//                // Title Label
////            Text("BASIC INFORMATION")
////                .font(.system(size: 24, weight: .bold))
////                .padding(.top, 20)
////                .padding(.horizontal, 20)
////                .frame(maxWidth: .infinity, alignment: .leading)
//                // Logo Image View
//                Image("profile")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)
//                    .clipShape(Circle())
//                    .padding(.top, 20)
////                    .padding(.bottom, 20)
//                Text("Profile Picture")
//                    .font(.system(size: 14, weigt: .regular))
//                    .foregroundColor(.grey)
//                    .padding(.top, 5)
//               
//                Text("BASIC INFORMATION")
//                    .font(.system(size: 14, weight: .bold))
//                    .padding(.top, 20)
//                    .padding(.horizontal, 20)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                
//                
//                // Basic Information Labels
//                ForEach(details, id: \.self) { detail in
//                    Text(detail)
//                        .font(.system(size: 16))
//                        .padding(.horizontal, 20)
//                }
//                
//                Spacer()
//            }
//        }
//        .background(Color.white)
//        .navigationBarTitle("Profile", displayMode: .inline)
//    }
//}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ProfileView()
//        }
//    }
//}


import SwiftUI

struct ProfileView: View {
    let details = [
        ("Employee ID/No", "456"),
        ("Full Name", "User"),
        ("Email", "useremail@test.com"),
        ("Joining Date", "01/05/2024"),
        ("Phone Num", "1234567890"),
        ("Designation", ""),
        ("Occupation", "")
    ]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Picture
                VStack {
                    Image("Image 24")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(.top, 20)
                    
                    Text("Profile Picture")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
                
                // Basic Information Section Title
                Text("BASIC INFORMATION")
                    .font(.system(size: 14, weight: .bold))
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Details Section
                VStack(spacing: 10) {
                    ForEach(details, id: \.0) { label, value in
                        HStack {
                            Text(label + ":")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                                .frame(width: 150, alignment: .leading)
                            
                            Text(value)
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
        .background(Color.white)
//        .navigationBarTitle("Profile", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "control")
                        .rotationEffect(.degrees(270))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                    
                })
            }
            ToolbarItem(placement: .topBarLeading) {
                Text("Profile")
                    .font(.title) // Change the font size here
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
            ProfileView()
//        }
    }
}
