//
//  ViewController.swift
//  Wealth captial
//
//  Created by Arshad on 16/12/24.


import SwiftUI

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        if hexSanitized.count == 6 {
            let scanner = Scanner(string: hexSanitized)
            var hexValue: UInt64 = 0
            if scanner.scanHexInt64(&hexValue) {
                self.init(
                    red: Double((hexValue & 0xFF0000) >> 16) / 255.0,
                    green: Double((hexValue & 0x00FF00) >> 8) / 255.0,
                    blue: Double(hexValue & 0x0000FF) / 255.0
                )
                return
            }
        }
        self.init(.black) // Default to black if the HEX code is invalid
    }
}
//struct ContentView: View {
//    @State private var navigateToLogin = false
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                // Background Color
//                Color.white
//                    .edgesIgnoringSafeArea(.all)
//                
//                VStack {
//                    // Logo Image
//                    Image("Logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 250, height: 250)
//                        .padding(.top, 100)
//                    Spacer()
//                    HStack{
//                        Spacer()
//                        // Get Started Button
//                        NavigationLink(destination: LoginView()
////                                       isActive: $navigateToLogin
//                        ) {
//                            Text("Get Started")
//                                .font(.system(size: 16, weight: .bold))
//                                .foregroundColor(.white)
////                                .frame(maxWidth: .infinity)
//                                .padding()
//                                .background(Color(hex:"#6ca44c"))
//                                .cornerRadius(20)
//                                .padding(.horizontal, 16)
//                                .padding(.bottom, 16)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        
//                    }
//                }
//            }
//            .navigationBarHidden(true) // Hides navigation bar on the initial screen
//        }
//    }
//}
//struct ContentView_Previews: PreviewProvider
//{
//    static var previews: some View{
//        ContentView()
//    }
//}
import SwiftUI

struct ArcButtonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start from top-left corner
        path.move(to: CGPoint(x: 300, y: 0))
               
               // Straight line to the top-right
        path.addLine(to: CGPoint(x:300, y: rect.height))
               //path.addLine(to: CGPoint(x: rect.width - rect.height / 2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
               
               // Add the arc
               path.addArc(
                   //center: CGPoint(x: rect.width - rect.height / 2, y: rect.height / 2),
                center: CGPoint(x: rect.height, y: rect.height),
                   radius: rect.height,
                   startAngle: .degrees(180),
                   endAngle: .degrees(-90),
                   clockwise: false
               )
               
               // Straight line to the bottom-left
              // path.addLine(to: CGPoint(x: 0, y: rect.height))
               
               // Close the path
               path.closeSubpath()
        
        return path
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack { 
                // Background Color
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    // Logo and Text with no space
                    VStack(spacing: 0) { // Absolutely no spacing
                        Image("Image 2") // Replace "57" with your actual logo name
                            .resizable()
                            .frame(width: 300, height: 350) // Larger logo
                            .padding(.bottom, 0) // No bottom padding
                        
//                        Text("ويلث كابيتال")
//                            .font(.system(size: 36, weight: .bold)) // Increased font size
//                            .foregroundColor(.black)
//                            .multilineTextAlignment(.center)
//                            .padding(.top, 0) // Ensure no top padding
//                        
//                        Text("WEALTH CAPITAL")
//                            .font(.system(size: 28, weight: .bold)) // Increased font size
//                            .foregroundColor(.black)
//                            .multilineTextAlignment(.center)
//                            .padding(.top, 0) // Ensure no top padding
                    }
                    
                    Spacer()
                    
                    // Get Started Button with Arc Design
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Get Started")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 24)
                                .background(
                                    ArcButtonShape()
                                        .fill(Color(hex:"#629f42"))
                                )
                                .frame(width: 140, height: 50) // Adjust width and height as needed
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
