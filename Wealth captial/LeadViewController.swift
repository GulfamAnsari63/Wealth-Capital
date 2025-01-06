
import SwiftUI

struct LeadView: View {
    @State private var selectedTab: LeadTab = .all
    @State private var leads: [Lead] = Lead.sampleData() // Sample static data
    
    var filteredLeads: [Lead] {
        switch selectedTab {
        case .all: return leads
        case .present: return leads.filter { $0.status == .present }
        case .upcoming: return leads.filter { $0.status == .upcoming }
        case .completed: return leads.filter { $0.status == .completed }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                Text("Total Leads")
                    .font(.title)
                    .bold()
//                    .padding(.top)
                
                // Tabs
                HStack {
                    ForEach(LeadTab.allCases, id: \.self) { tab in
                        Button(action: {
                            withAnimation {
                                selectedTab = tab
                            }
                        }) {
                            Text(tab.rawValue.capitalized)
                                .fontWeight(selectedTab == tab ? .semibold : .regular)
                                .foregroundColor(selectedTab == tab ? .black : .gray)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
//                                .background(
//                                    selectedTab == tab
//                                    ? Color.green.opacity(0.2)
//                                    : Color.clear
//                                )
                        }
                    }
                }
                .padding(.horizontal)
                
                // Underline animation for tabs
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundColor(.gray)
//                    .padding(.horizontal)
//                    .offset(x: selectedTab == .completed ? UIScreen.main.bounds.width / 4 * 3 :
//                            selectedTab == .present ? 0 : UIScreen.main.bounds.width / 4)
//                GeometryReader { geometry in
//                                   Rectangle()
//                                       .frame(height: 2)
//                                       .foregroundColor(.blue)
//                                       .padding(.horizontal)
//                                       .offset(x: calculateTabOffset(for: selectedTab, in: geometry.size.width))
//                                       .animation(.easeInOut, value: selectedTab)
//                               }
//                               .frame(height: 2)
                
                // Individual Lead Views
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(filteredLeads) { lead in
                            LeadRowView(lead: lead)
                        }
                    }
                    .padding(.horizontal)
                }
//                .padding(.top, 8)
            }
        }
    }
}

enum LeadTab: String, CaseIterable {
    case all, present, upcoming, completed
}

struct Lead: Identifiable {
    let id: Int
    let name: String
    let phone: String
    let email: String
    let status: LeadStatus
    let taskID: String
}

enum LeadStatus: String {
    case pending = "Pending"
    case present = "RFO"
    case upcoming = "PO"
    case completed = "Transmit"
}

extension Lead {
    static func sampleData() -> [Lead] {
        return [
            Lead(id: 1, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .pending, taskID: "TASKID#001"),
            Lead(id: 2, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .present, taskID: "TASKID#002"),
            Lead(id: 3, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .upcoming, taskID: "TASKID#003"),
            Lead(id: 4, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .completed, taskID: "TASKID#004"),
            Lead(id: 5, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .upcoming, taskID: "TASKID#003"),
            Lead(id: 6, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .completed, taskID: "TASKID#004")
        ]
    }
}

struct LeadRowView: View {
    let lead: Lead
    
    var statusColor: Color {
        switch lead.status {
        case .pending: return .green
        case .present: return .green
        case .upcoming: return .green
        case .completed: return .green
        }
    }
    var body: some View {
        NavigationLink(destination: LeadDetailsView()){
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(lead.status.rawValue.uppercased())
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                        .padding(4)
                        .background(statusColor)
//                        .cornerRadius(6)
                    Spacer()
                    Text(lead.taskID)
                        .font(.caption)
                        .foregroundColor(.black)
                    
                    Image(systemName: "ellipsis")
                        .font(.title3) // Adjust size of the icon
                        .foregroundColor(.black) 
                        .rotationEffect(.degrees(90))
                        .padding(.leading)
                }
                Divider()
                    .background(Color.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        // Profile Image on the left
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(lead.name)
                                .font(.headline)
                            Text("Mob: \(lead.phone)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Email: \(lead.email)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
//                        Spacer()
                    }
                }
//                Spacer()
                
                Divider()
                    .background(Color.black)
                
                // Action Buttons
                HStack {
                    Button(action: {
                        print("Send product details for \(lead.name)")
                    }) {
                        Label("Send product details", systemImage: "checklist")
                            .foregroundColor(.secondary)
                            .font(.footnote)
//                            .padding(.horizontal)
                    }
                    Divider()
                        .background(Color.black)
                    NavigationLink(destination: ContactsView()){
                        Label("Send quotation", systemImage: "doc.text")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                            
                    }
                }

            }
            .padding(.vertical)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .gray.opacity(0.4), radius: 3, x: 0, y: 3)
        }
        .buttonStyle(PlainButtonStyle())
    }
    private func calculateTabOffset(for tab: LeadTab, in totalWidth: CGFloat) -> CGFloat {
           let tabWidth = totalWidth / CGFloat(LeadTab.allCases.count)
           
           switch tab {
           case .all:
               return 0
           case .present:
               return tabWidth
           case .upcoming:
               return tabWidth * 2
           case .completed:
               return tabWidth * 3
           }
       }
}

struct LeadView_Previews: PreviewProvider {
    static var previews: some View {
        LeadView()
    }
}
//
//import SwiftUI
//
//struct LeadView: View {
//    @State private var selectedTab: LeadTab = .all
//    @State private var leads: [Lead] = Lead.sampleData() // Sample static data
//    
//    var filteredLeads: [Lead] {
//        switch selectedTab {
//        case .all: return leads
//        case .present: return leads.filter { $0.status == .present }
//        case .upcoming: return leads.filter { $0.status == .upcoming }
//        case .completed: return leads.filter { $0.status == .completed }
//        }
//    }
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Header
//                Text("Total Leads")
//                    .font(.title)
//                    .bold()
//                
//                // Tabs
//                HStack {
//                    ForEach(LeadTab.allCases, id: \.self) { tab in
//                        Button(action: {
//                            withAnimation {
//                                selectedTab = tab
//                            }
//                        }) {
//                            Text(tab.rawValue.capitalized)
//                                .fontWeight(selectedTab == tab ? .semibold : .regular)
//                                .foregroundColor(selectedTab == tab ? .black : .gray)
//                                .padding(.vertical,4)
//                                .padding(.horizontal,0)
//                                .frame(maxWidth: .infinity) // Make each tab fill its space
//                        }
//                    }
//                }
//                .padding(.horizontal)
//                .overlay(
//                    // Underline only for the selected tab
//                    GeometryReader { geometry in
//                        Rectangle()
//                            .frame(height: 2)
//                            .foregroundColor(.blue)
//                            .offset(x: calculateTabOffset(for: selectedTab, in: geometry.size.width), y: geometry.size.height - 2)
//                            .frame(width: calculateTabWidth(in: geometry.size.width))
//                            .animation(.easeInOut, value: selectedTab)
//                    }
//                )
//                
//                // Individual Lead Views
//                ScrollView {
//                    VStack(spacing: 14) {
//                        ForEach(filteredLeads) { lead in
//                            LeadRowView(lead: lead)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//        }
//    }
//    
//    // Calculate the offset for the underline based on the selected tab
//    private func calculateTabOffset(for tab: LeadTab, in totalWidth: CGFloat) -> CGFloat {
//        let tabWidth = totalWidth / CGFloat(LeadTab.allCases.count)
//        
//        switch tab {
//        case .all:
//            return 0
//        case .present:
//            return tabWidth
//        case .upcoming:
//            return tabWidth * 2
//        case .completed:
//            return tabWidth * 3
//        }
//    }
//    
//    // Calculate the width of each tab based on the total width of the container
//    private func calculateTabWidth(in totalWidth: CGFloat) -> CGFloat {
//        return totalWidth / CGFloat(LeadTab.allCases.count)
//    }
//}
//
//enum LeadTab: String, CaseIterable {
//    case all, present, upcoming, completed
//}
//
//struct Lead: Identifiable {
//    let id: Int
//    let name: String
//    let phone: String
//    let email: String
//    let status: LeadStatus
//    let taskID: String
//}
//
//enum LeadStatus: String {
//    case pending = "Pending"
//    case present = "RFO"
//    case upcoming = "PO"
//    case completed = "Transmit"
//}
//
//extension Lead {
//    static func sampleData() -> [Lead] {
//        return [
//            Lead(id: 1, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .pending, taskID: "TASKID#001"),
//            Lead(id: 2, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .present, taskID: "TASKID#002"),
//            Lead(id: 3, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .upcoming, taskID: "TASKID#003"),
//            Lead(id: 4, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .completed, taskID: "TASKID#004"),
//            Lead(id: 5, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .upcoming, taskID: "TASKID#003"),
//            Lead(id: 6, name: "Cristina Martin", phone: "+91 9876543212", email: "christina@gmail.com", status: .completed, taskID: "TASKID#004")
//        ]
//    }
//}
//
//struct LeadRowView: View {
//    let lead: Lead
//    
//    var statusColor: Color {
//        switch lead.status {
//        case .pending: return .green
//        case .present: return .green
//        case .upcoming: return .green
//        case .completed: return .green
//        }
//    }
//    var body: some View {
//        NavigationLink(destination: LeadDetailsView()){
//            VStack(alignment: .leading, spacing: 8) {
//                HStack {
//                    Text(lead.status.rawValue.uppercased())
//                        .font(.caption)
//                        .bold()
//                        .foregroundColor(.white)
//                        .padding(4)
//                        .background(statusColor)
//                    Spacer()
//                    Text(lead.taskID)
//                        .font(.caption)
//                        .foregroundColor(.black)
//                    
//                    Image(systemName: "ellipsis")
//                        .font(.title3) // Adjust size of the icon
//                        .foregroundColor(.black)
//                        .rotationEffect(.degrees(90))
//                        .padding(.leading)
//                }
//                Divider()
//                
//                VStack(alignment: .leading, spacing: 8) {
//                    HStack {
//                        // Profile Image on the left
//                        Image(systemName: "person.circle.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 40, height: 40)
//                            .foregroundColor(.gray)
//                            .padding(.trailing, 8)
//                        
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text(lead.name)
//                                .font(.headline)
//                            Text("Mob: \(lead.phone)")
//                                .font(.subheadline)
//                                .foregroundColor(.secondary)
//                            Text("Email: \(lead.email)")
//                                .font(.subheadline)
//                                .foregroundColor(.secondary)
//                        }
//                    }
//                }
//                
//                Divider()
//                
//                // Action Buttons
//                HStack {
//                    Button(action: {
//                        print("Send product details for \(lead.name)")
//                    }) {
//                        Label("Send product details", systemImage: "checklist")
//                            .foregroundColor(.secondary)
//                            .font(.footnote)
//                    }
//                    Spacer()
//                    Divider()
//                    NavigationLink(destination: ContactsView())
//                        {
//                            Label("Send quotation", systemImage: "doc.text")
//                                .foregroundColor(.secondary)
//                                .font(.footnote)
//                        
//                    }
//                }
//
//            }
//            .padding(.vertical)
//            .padding(.horizontal)
//            .background(Color.white)
//            .cornerRadius(8)
//            .shadow(color: .gray.opacity(0.4), radius: 3, x: 0, y: 3)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
//
//struct LeadView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeadView()
//    }
//}
