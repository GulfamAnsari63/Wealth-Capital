//
//  LoginViewController.swift
//  Wealth captial
//
//  Created by Arshad on 16/12/24.
//
//
//import SwiftUI
//
//struct LoginView: View {
//    
//    @State private var email: String = ""
//    @State private var password: String = ""
//    
//    var body: some View {
//        NavigationStack{
//            VStack {
//                HStack{
//                    Text("Hii, \nPlease Login")
//                        .font(.system(size: 26, weight: .bold))
//                        .foregroundColor(.black)
//                        .multilineTextAlignment(.leading)
//                        .padding(.top, 60)
//                        .padding(.leading, 10)
//                    Spacer()
//                }
//                Spacer()
//                
//                // Logo Image
//                //            Image("Wealth_Logo")
//                //                .resizable()
//                //                .scaledToFit()
//                //                .frame(width: 150, height: 150)
//                
//                // Capital Logo Image Below "WEALTH CAPITAL"
//                Image("Add")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)
//                
//                Spacer()
//                
//                VStack(alignment: .leading) {
//                    Text("Email")
//                        .font(.system(size: 16, weight: .bold))
//                        .foregroundColor(.black)
//                    
//                    TextField("email@test.com", text: $email)
//                        .padding()
//                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray))
//                        .autocapitalization(.none)
//                }
//                .padding(.horizontal, 40)
//                .padding(.bottom, 30)
//                
//                
//                VStack(alignment: .leading) {
//                    Text("Password")
//                        .font(.system(size: 16, weight: .bold))
//                        .foregroundColor(.black)
//                    
//                    SecureField("********", text: $password)
//                        .padding()
//                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray))
//                }
//                .padding(.horizontal, 40)
//                .padding(.bottom, 20)
//                
//                NavigationLink(destination: ForgotPasswordView()){
//                    Text("Don't remember Password? Recover it")
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray)
//                        .padding(.bottom, 20)
//                }
//                
//                // Login Button
//                Button(action: {
//                    //                    loginButtonTapped()
//                }) {
//                    NavigationLink(destination: VerifyAccountView()){
//                        Text("Login")
//                            .font(.system(size: 18, weight: .bold))
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color(hex:"#629f41"))
//                            .cornerRadius(8)
//                    }
//                }
//                .padding(.horizontal, 40)
//                .padding(.bottom, 20)
//                
//                // Signup Label
//                NavigationLink(destination: SignupView()){
//                    Text("Don't have account? Signup")
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray)
//                    
//                }
//                Spacer()
//            }
//            .background(Color.white)
//            .edgesIgnoringSafeArea(.all)
//        }
//    }
//    // MARK: - Button Actions
//    func loginButtonTapped() {
//        print("Login button tapped")
//        
//    }
//    
//    func recoverPasswordTapped() {
//        print("Recover Password tapped")
//    }
//}
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                HStack{
                    Text("Hi, \nPlease Login")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 70.0)
                        .padding(.leading, 5.0)
                        .frame(width: 200.0, height: 150.0)
                    Spacer()
                }
              
//                Image("Image 3")
//                  .resizable()
//                  .scaledToFit()
//                  .frame(width: 300, height: 200)
//                  .padding(.bottom, 0)
//                Text("WEALTH CAPITAL")
//                    .font(.system(size: 22, weight: .bold)) // Increased font size
//                    .foregroundColor(.black)
//                    .multilineTextAlignment(.center)
                //                            .padding(.top, 0)
                // Logo Image
                            Image("Image 4")
                              .resizable()
                              .scaledToFit()
                              .frame(width: 180, height: 250)
                
             
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                    
                    TextField("email @test.com", text: $email)
                        .padding()
                        .foregroundColor(.gray)
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray))
                        .autocapitalization(.none)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
                
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                    
                    SecureField("********", text: $password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray))
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
                
                NavigationLink(destination: ForgotPasswordView()){
                    
                    Text("Don't remember Password? Recover it")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                }
                
                // Login Button
                Button(action: {
                    //                    loginButtonTapped()
                }) {
                    NavigationLink(destination: VerifyAccountView()){
                        Text("Login")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.4235294117647059, green: 0.6431372549019608, blue: 0.2980392156862745))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
                
                // Signup Label
                NavigationLink(destination: SignupView()){
                    Text("Don't have account? Signup")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                }
                Spacer()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
    // MARK: - Button Actions
    func loginButtonTapped() {
        print("Login button tapped")
        
    }
    
    func recoverPasswordTapped() {
        print("Recover Password tapped")
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
