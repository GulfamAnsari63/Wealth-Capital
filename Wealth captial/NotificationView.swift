//
//  NotificationView.swift
//  Wealth captial
//
//  Created by Arshad on 18/12/24.
//

//
//import SwiftUI
//
//struct NotificationView: View {
//    var body: some View {
//        VStack {
//            Text("Notifications")
//                .font(.largeTitle)
//                .bold()
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .leading)
//            Spacer()
//        }
//        .background(Color.white)
//        }
//    
//}
//
//struct NotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationView()
//    }
//}
//


import SwiftUI

struct NotificationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isVisible: Bool = true // Controls the visibility of the notification
    
    var body: some View {
        VStack {
            if isVisible {
                HStack(alignment: .top) {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        .lineLimit(nil)
                    
                    Button(action: {
                        withAnimation {
                            isVisible = false // Dismiss notification
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding(10)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                .padding(.horizontal)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
            
            Spacer()
        }
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
                Text("Notifications")
                    .font(.title) // Change the font size here
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
            }
        }
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all)) // Background color
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
