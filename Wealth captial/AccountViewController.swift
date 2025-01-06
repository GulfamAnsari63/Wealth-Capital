//import SwiftUI
//
//struct AccountView: View {
//    @State private var email = "useremail@test.com"
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                VStack(spacing: 8) {
//                    Image(systemName: "person.crop.circle.fill") // Replace with user profile image
//                        .resizable()
//                        .frame(width: 80, height: 80)
//                        .foregroundColor(.gray)
//                        .clipShape(Circle())
////                        .padding(.top, 10)
//                    
//                    Text(email)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                .padding(.bottom, 8)
//                
//                // MARK: - General Section
//                Section(header: Text("GENERAL")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//                    .padding(.horizontal)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                ) {
//                    HStack {
//                        Label("Version", systemImage: "gearshape")
//                        Spacer()
//                        Text("1.0.0")
//                            .foregroundColor(.secondary)
//                    }
//                    .padding(.horizontal)
//                    .padding()
//                }
//                
//                // MARK: - Account Options
//                Section(header: Text("ACCOUNT")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//                    .padding(.horizontal)
//                    .frame(maxWidth: .infinity, alignment: .leading)){
//                        
//                        
//                        VStack(spacing: 12) {
//                            NavigationLink(destination: ProfileView()) {
//                                AccountRow(title: "Profile", icon: "person.fill")
//                            }
//                            
//                            NavigationLink(destination: ChangePasswordView()) {
//                                AccountRow(title: "Change Password", icon: "lock.fill")
//                            }
//                            
//                            NavigationLink(destination: DeleteAccountView()) {
//                                AccountRow(title: "Delete Account", icon: "trash.fill")
//                            }
//            
//                            NavigationLink(destination:LogoutView()){
//                                AccountRow(title: "Logout", icon: "arrow.right.square.fill", isDestructive: true)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//            }
//                
//                Spacer()
//            }
////            .navigationTitle("Account")
////            .background(Color.white.edgesIgnoringSafeArea(.all))
////            .navigationBarBackButtonHidden(false)
//    }
//}
//
//
//struct AccountRow: View {
//    let title: String
//    let icon: String
//    var isDestructive: Bool = false
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .foregroundColor(isDestructive ? .black : .black)
//            Text(title)
//                .foregroundColor(isDestructive ? .black : .primary)
//            Spacer()
//            if !isDestructive {
//                Image(systemName: "chevron.right")
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding(.vertical, 6)
//    }
//}
//
//struct AccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountView()
//    }
//}



import SwiftUI

struct AccountView: View {
    @State private var email = "useremail@test.com"
    
    var body: some View {
        NavigationView {
            VStack{
                // MARK: - Header Section (Profile Picture and Title)
//                Text("Account")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.top, 10)  // Account title
                
                // Profile Picture
                Image(systemName: "person.crop.circle.fill") // Replace with user profile image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
                    .clipShape(Circle())
//                    .padding(.top, 8)
//                    .padding(.horizontal)
                
                Text(email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                // MARK: - General Section
                Section(header: Text("GENERAL")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)) {
                    HStack {
                        Label("Version", systemImage: "gearshape")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding()
                }
                
                // MARK: - Account Options
                Section(header: Text("ACCOUNT")
                            .font(.caption)
                            .padding(.horizontal)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)) {
                    VStack(spacing: 12) {
                        NavigationLink(destination: ProfileView()) {
                            AccountRow(title: "Profile", icon: "person.fill")
                        }
                        
                        NavigationLink(destination: ChangePasswordView()) {
                            AccountRow(title: "Change Password", icon: "lock.fill")
                        }
                        
                        NavigationLink(destination: DeleteAccountView()) {
                            AccountRow(title: "Delete Account", icon: "trash.fill")
                        }
                        
                        NavigationLink(destination: LogoutView()) {
                            AccountRow(title: "Logout", icon: "arrow.right.square.fill", isDestructive: true)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
//            .navigationTitle("Accounts")
//            .padding()
//            .navigationBarHidden(true)
//            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct AccountRow: View {
    let title: String
    let icon: String
    var isDestructive: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(isDestructive ? .black: .black)
            Text(title)
                .foregroundColor(isDestructive ? .black : .primary)
            Spacer()
            if !isDestructive {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 6)
//        .background(Color(UIColor.secondarySystemBackground))
//        .cornerRadius(8)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
