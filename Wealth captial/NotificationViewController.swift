//
//  NotificationViewController.swift
//  Wealth captial
//
//  Created by Arshad on 17/12/24.
//

//import UIKit
//
//class NotificationViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Notifications"
//    }
//}
import SwiftUI

struct NtificationView: View {
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
        .navigationTitle("Notifications")
        .padding()
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all)) // Background color
    }
}

struct NtificationView_Previews: PreviewProvider {
    static var previews: some View {
        NtificationView()
    }
}
