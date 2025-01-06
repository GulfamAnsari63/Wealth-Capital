//
//  LeadDetailView.swift
//  Wealth captial
//
//  Created by Arshad on 30/12/24.
//

import SwiftUI

struct LeadDetailsView: View {
    @State private var dueDate = Date()
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy hh:mm a"
        return formatter
    }
    private func formattedDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Top Bar
            HStack {
                Text("Lead Details")
                    .font(.headline)
                    .fontWeight(.bold )
                Spacer()
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
            }
            .padding()
            //            .background(Color.gray.opacity(0.2))
            
            // Status and Header
            HStack {
                Text("Following")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.gray)
                //                    .cornerRadius(8)
                
                Text("High")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.red)
                //                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 5)
//            .padding()
            
            // Lead Information
            VStack(alignment: .leading, spacing: 6) {
//                .padding(.top)
                HStack{
                    Text("Cristina Martin")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    Text("Mumbai")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                }
                
                Text("No company name")
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                Text("@ no email")
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                
                
                Text("Opportunity Amount: 16,200")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                HStack{
                    Text("Source: Call")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Text(formattedDate(dueDate))
                        .font(.body)
                        .foregroundColor(.white)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
                }
//                .padding()
                
                HStack {
                    Text("FOLLOW UP")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("PRODUCT")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("ATTACHMENTS")
                        .font(.headline)
                        .foregroundColor(.white)
                
            }
                .padding()
//                .background(Color.green.opacity(0.2))
            }
            .padding(.horizontal)
            .background(Color(hex:"#6ca44c").opacity(1))
            
            // Tabs
           
            
            // Timeline
            ScrollView {
                VStack(alignment: .leading, spacing: 26) {
                    TimelineEntryView(
                        type: "Call",
                        date: "28 Sep 2017 11:00 AM",
                        note: "Ask for purchase",
                        createdDate: "23 Sep 2017 03:03 PM",
                        isLast: false
                    )
                    TimelineEntryView(
                        type: "Call",
                        date: "27 Sep 2017 11:00 AM",
                        note: "Ask for purchase",
                        createdDate: "23 Sep 2017 03:02 PM",
                        isLast: false
                    )
                    TimelineEntryView(
                        type: "Mail",
                        date: "25 Sep 2017 10:00 AM",
                        note: "Send quotation",
                        createdDate: "23 Sep 2017 03:02 PM",
                        isLast: true
                    )
                }
                .padding()
            }
            // Floating Action Button
            Spacer()
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 56, height: 56)
                        .background(Color(hex:"#6ca44c"))
                        .clipShape(Circle())
                }
                .padding()
            }
        }
    }
}
struct TimelineEntryView: View {
    var type: String
    var date: String
    var note: String
    var createdDate: String
    var isLast: Bool // To determine if it's the last entry

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Timeline Indicator
            VStack(spacing: 0) {
                Circle()
                    .fill(Color.green)
                    .frame(width: 16, height: 16)

                if !isLast {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 2, height: 44) // Adjust height to fit spacing
                }
            }
            .padding(.top, 2) // Ensures alignment with text content

            // Entry Details
            VStack(alignment: .leading, spacing: 4) {
                Text(type)
                    .font(.headline)
                Text("Follow Up Date: \(date)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Note: \(note)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Created on \(createdDate)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical,2) // Adds spacing between entries
    }
}


struct LeadDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LeadDetailsView()
    }
}

//
//import SwiftUI
//
//struct LeadDetailsView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            // Top Bar
//            HStack {
//                Text("< Lead Details")
//                    .font(.headline)
//                Spacer()
//                Image(systemName: "ellipsis")
//            }
//            .padding()
//            .background(Color.gray.opacity(0.2))
//            
//            // Status and Header
//            HStack {
//                Text("Following")
//                    .font(.subheadline)
//                    .foregroundColor(.white)
//                    .padding(8)
//                    .background(Color.blue)
//                    .cornerRadius(8)
//                
//                Text("High")
//                    .font(.subheadline)
//                    .foregroundColor(.white)
//                    .padding(8)
//                    .background(Color.red)
//                    .cornerRadius(8)
//            }
//            .padding(.horizontal)
//            
//            // Lead Information
//            VStack(alignment: .leading, spacing: 4) {
//                Text("Ravi Sharma")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                
//                Text("No company name")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                
//                Text("@ no email")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                
//                Text("Mumbai")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                
//                Text("Opportunity Amount: 16,200")
//                    .font(.headline)
//                    .padding(.top, 8)
//                
//                Text("Source: Call")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//            .padding(.horizontal)
//            
//            // Tabs
//            HStack {
//                Text("FOLLOW UP")
//                    .font(.headline)
//                    .foregroundColor(.blue)
//                Spacer()
//                Text("PRODUCT")
//                    .font(.headline)
//                    .foregroundColor(.gray)
//                Spacer()
//                Text("ATTACHMENTS")
//                    .font(.headline)
//                    .foregroundColor(.gray)
//            }
//            .padding()
//            .background(Color.green.opacity(0.2))
//            
//            // Timeline
//            ScrollView {
//                VStack(alignment: .leading, spacing: 0) {
//                    TrackingTimelineEntry(
//                        type: "Call",
//                        date: "28 Sep 2017 11:00 AM",
//                        note: "Ask for purchase",
//                        createdDate: "23 Sep 2017 03:03 PM",
//                        isLast: false
//                    )
//                    TrackingTimelineEntry(
//                        type: "Call",
//                        date: "27 Sep 2017 11:00 AM",
//                        note: "Ask for purchase",
//                        createdDate: "23 Sep 2017 03:02 PM",
//                        isLast: false
//                    )
//                    TrackingTimelineEntry(
//                        type: "Mail",
//                        date: "25 Sep 2017 10:00 AM",
//                        note: "Send quotation",
//                        createdDate: "23 Sep 2017 03:02 PM",
//                        isLast: true // Last entry
//                    )
//                }
//                .padding()
//            }
//            
//            // Floating Action Button
//            Spacer()
//            HStack {
//                Spacer()
//                Button(action: {}) {
//                    Image(systemName: "plus")
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .frame(width: 56, height: 56)
//                        .background(Color.green)
//                        .clipShape(Circle())
//                }
//                .padding()
//            }
//        }
//    }
//}
//
//struct TrackingTimelineEntry: View {
//    var type: String
//    var date: String
//    var note: String
//    var createdDate: String
//    var isLast: Bool // To determine if it's the last entry
//    
//    var body: some View {
//        HStack(alignment: .top, spacing: 16) {
//            // Timeline Indicator
//            VStack {
//                Circle()
//                    .fill(Color.green)
//                    .frame(width: 16, height: 16)
//                
//                if !isLast {
//                    Rectangle()
//                        .fill(Color.green)
//                        .frame(width: 2, height: 50) // Connects to the next entry
//                }
//            }
//            
//            // Entry Details
//            VStack(alignment: .leading, spacing: 4) {
//                Text(type)
//                    .font(.headline)
//                Text("Follow Up Date: \(date)")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                Text("Note: \(note)")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                Text("Created on \(createdDate)")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//        }
//    }
//}
//
//struct LeadDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeadDetailsView()
//    }
//}
