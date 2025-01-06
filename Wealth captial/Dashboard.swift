
import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            HomeTab()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            LeadView()
                .tabItem {
                    Label("Lead", systemImage: "person.2.fill")
                }
            
            TaskTab()
                .tabItem {
                    Label("Task", systemImage: "checkmark.circle.fill")
                }
            
            NotificationTab()
                .tabItem {
                    Label("Notification", systemImage: "bell.fill")
                }
            
            AccountTab()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

// Home Tab
struct HomeTab: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome, John!")
                    .font(.headline)
                    .padding()
                
                HStack {
                    DashboardCard(title: "Total Leads", value: "124")
                    DashboardCard(title: "Total Tasks", value: "58")
                }
                .padding(.horizontal)
                
                Text("Activity Feed")
                    .font(.title3)
                    .padding(.top)
                
                Spacer()
                Text("(Graph or recent activities placeholder)")
                    .foregroundColor(.gray)
                    .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(value)
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(12)
    }
}

// Lead Tab
struct Leadview: View {
    var body: some View {
        NavigationView {
            List {
                LeadRow(name: "John Doe", status: "Active")
                LeadRow(name: "Jane Smith", status: "Pending")
            }
            .navigationTitle("Active Leads")
        }
    }
}

struct LeadRow: View {
    var name: String
    var status: String
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(status)
                .foregroundColor(status == "Active" ? .green : .orange)
        }
    }
}

// Task Tab
struct TaskTab: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
//                    TaskRow(task: "Task 1", dueDate: "2025-01-01", priority: "Important")
//                    TaskRow(task: "Task 2", dueDate: "2025-01-02", priority: "Normal")
                }
                .listStyle(InsetGroupedListStyle())
                
                Spacer()
                
                Button(action: {
                    // Add Task Action
                }) {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding()
            }
            .navigationTitle("Upcoming Tasks")
        }
    }
}

//struct TaskRow: View {
//    var task: String
//    var dueDate: String
//    var priority: String
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(task)
//                .font(.headline)
//            Text("Due: \(dueDate)")
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            Text(priority)
//                .font(.caption)
//                .foregroundColor(priority == "Important" ? .red : .gray)
//        }
//        .padding()
//    }
//}

// Notification Tab
struct NotificationTab: View {
    var body: some View {
        NavigationView {
            List {
                NotificationRow(title: "New Lead Added", time: "2 min ago")
                NotificationRow(title: "Task Completed", time: "1 hour ago")
            }
            .navigationTitle("Notifications")
        }
    }
}

struct NotificationRow: View {
    var title: String
    var time: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}

// Account Tab
struct AccountTab: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Name: John Doe")
                    Text("Email: johndoe@example.com")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(12)
                
                Button(action: {
                    // Edit Account Action
                }) {
                    Text("Edit Account")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Account Settings")
        }
    }
}

// Preview
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
