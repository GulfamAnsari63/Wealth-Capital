
import SwiftUI
import Combine
struct VerifyAccountView: View {
    @State private var otpCode: [String] = ["", "", "", "", "", ""]
    @State private var timer = "01:30"
    @FocusState private var focusedField: Int?
    
    var body: some View {
        VStack {
            Text("Verify Your \nAccount")
                .font(.title)
                .bold()
                .padding(.top, 40)
            
            Image("Image 6")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .padding(.vertical, 20)
            
            Text("Please type verification code sent to your registered email")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing: 10) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: Binding(
                        get: { otpCode[index] },
                        set: { newValue in
                            // Ensure array bounds safety
                            if newValue.count <= 1 {
                                otpCode[index] = newValue
                                
                                // Move focus forward or backward safely
                                if newValue.isEmpty, index > 0 {
                                    focusedField = index - 1
                                } else if newValue.count == 1, index < 5 {
                                    focusedField = index + 1
                                }
                            }
                        }
                    ))
                    .frame(width: 40, height: 50)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: index)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
            }
            .padding()
            
            Text(timer)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            Button(action: {
                // Verify Action
            }) {
                NavigationLink(destination:MainTabBarView()){
                    Text("Verify")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"#629f42"))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            Button(action: {
                // Resend OTP
            }) {
                Text("Resend Code")
                    .foregroundColor(.green)
                    .underline()
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .onAppear {
            focusedField = 0
        }
    }
}

//
//
//import SwiftUI
//import Combine
//
//struct VerifyAccountView: View {
//    @State private var otpCode: [String] = ["", "", "", "", "", ""]
//    @State private var timer: Int = 90 // Timer in seconds
//    @State private var showAlert = false
//    @FocusState private var focusedField: Int?
//    
//    private var timerString: String {
//        String(format: "%02d:%02d", timer / 60, timer % 60)
//    }
//    
//    var body: some View {
//        VStack {
//            Text("Verify Your \nAccount")
//                .font(.title)
//                .bold()
//                .padding(.trailing, 200.0)
//            
//            Image("verify")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 180.0, height: 180.0)
//                .foregroundColor(.green)
//                .padding(.vertical, 20)
//            
//            Text("Please type verification code sent to your registered email")
//                .font(.subheadline)
//                .foregroundColor(Color(hue: 0.254, saturation: 0.344, brightness: 0.726))
//                .multilineTextAlignment(.center)
//                .padding()
//            
//            HStack(spacing: 10) {
//                ForEach(0..<6) { index in
//                    TextField("", text: $otpCode[index])
//                        .frame(width: 40, height: 50)
//                        .multilineTextAlignment(.center)
//                        .keyboardType(.numberPad)
//                        .focused($focusedField, equals: index)
//                        .onChange(of: otpCode[index]) { _ in
//                            if otpCode[index].count == 1, index < 5 {
//                                focusedField = index + 1
//                            } else if otpCode[index].isEmpty, index > 0 {
//                                focusedField = index - 1
//                            }
//                        }                        .overlay(
//                            RoundedRectangle(cornerRadius: 5)
//                                .stroke(Color.gray, lineWidth: 1)
//                        )
//                }
//            }
//            .padding()
//            
//            Text(timerString)
//                .foregroundColor(.gray)
//                .padding(.bottom, 20)
//            
//            Button(action: {
//                // Verify Action
//                showAlert = true // Example feedback
//            }) {
//                Text("Verify")
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color(hex: "#629f42"))
//                    .cornerRadius(10)
//            }
//            .padding(.horizontal)
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Verification"), message: Text("Verification Submitted"), dismissButton: .default(Text("OK")))
//            }
//            
//            Button(action: {
//                // Resend OTP Logic
//                timer = 90 // Restart the timer
//            }) {
//                Text("Resend Code")
//                    .foregroundColor(.gray)
//                    .underline()
//            }
//            .padding(.top, 10)
//            
//            Spacer()
//        }
//        .padding()
//        .onAppear {
//            focusedField = 0
//            startTimer()
//        }
//    }
//    
//    // Timer logic
//    private func startTimer() {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            if self.timer > 0 {
//                self.timer -= 1
//            } else {
//                timer.invalidate()
//            }
//        }
//    }
//}
//
//// Hex color extension (if not already defined)
//
struct VerifyAccount_Previews: PreviewProvider {
    static var previews: some View {
        VerifyAccountView()
    }
}
