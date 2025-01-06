//
//  ChatScreen.swift
//  Wealth captial
//
//  Created by Arshad on 19/12/24.
//

import SwiftUI

struct ChatScreen: View {
    @State private var messageText: String = ""
    
    var body: some View {
        VStack {
    
            HStack {
                Button(action: {
                    // back button
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Text("Remark")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
            .background(Color(hex:"#629f42"))

        
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ChatBubble(message: "Hello there", time: "June 10, 2024 05:01 PM")
                    ChatBubble(message: "sir,", time: "June 10, 2024 05:02 PM")
                    ChatBubble(message: "Offer Letter ?", time: "Jan 10, 2025 10:02 AM")
                }
                .padding()
            }

            HStack {
                TextField("You will recieve Soon..", text: $messageText)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(40)

                Button(action: {
                }) {
                    Image( "Image 20")
                        .resizable()
                        .scaledToFit()
                        .frame(width:40,height:40)
                       
                }
            }
            .padding()
            .background(Color.white)
        }
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

struct ChatBubble: View {
    let message: String
    let time: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(message)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(18)
            
            Text(time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
    }
}
