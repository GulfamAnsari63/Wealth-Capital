//
//import SwiftUI
//import Charts
//
//struct DashboardView: View {
//    var body: some View {
//        TabView {
//            HomeTab()
//                .tabItem {
//                    Label("Home", systemImage: "house.fill")
//                }
//            
//            LeadView()
//                .tabItem {
//                    Label("Lead", systemImage: "person.2.fill")
//                }
//            
//            TaskTab()
//                .tabItem {
//                    Label("Task", systemImage: "checkmark.circle.fill")
//                }
//            
//            NotificationTab()
//                .tabItem {
//                    Label("Notification", systemImage: "bell.fill")
//                }
//            
//            AccountTab()
//                .tabItem {
//                    Label("Account", systemImage: "person.crop.circle.fill")
//                }
//        }
//    }
//}
//
//// Home Tab
//struct HomeTab: View {
//    var body: some View {
//        NavigationView {
//            ScrollView { // Add ScrollView here
//                VStack(spacing: 20) {
//                    // Welcome Text
//                    HStack {
//                        Text("Welcome, John!")
//                            .font(.headline)
//                            .padding()
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                    // Dashboard Cards
//                    HStack {
//                        DashboardCard(title: "CurrentTask", value: "0")
//                        DashboardCard(title: "Total Leads", value: "124")
//                        DashboardCard(title: "Total Tasks", value: "58")
//                    }
//                    .padding(.horizontal)
//
//                    // Activity Feed Section
//                    Section(header: Text("Activity Feed")
//                        .font(.title3)
//                        .padding(.horizontal)
//                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity, alignment: .leading)) {
//                        VStack(spacing: 12) {
//                            NavigationLink(destination: AccountView()) {
//                                AccountRow(title: "Profile", icon: "person.fill")
//                            }
//
//                            NavigationLink(destination: AddTaskView()) {
//                                AccountRow(title: "Create Task", icon: "plus")
//                            }
//
//                            NavigationLink(destination: Leadview()) {
//                                AccountRow(title: "Active Leads", icon: "person.2")
//                            }
//
//                            NavigationLink(destination: LogoutView()) {
//                                AccountRow(title: "Logout", icon: "arrow.right.square.fill", isDestructive: true)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//
//                    // Recent Activities Chart
//                    VStack(alignment: .leading, spacing: 20) {
//                        Text("Recent Activities")
//                            .font(.headline)
//                            .padding(.horizontal)
//                        VStack(alignment: .leading, spacing: 12) {
//                               ForEach(recentActivities) { activity in
//                                   HStack {
//                                       VStack(alignment: .leading) {
//                                           Text(activity.title)
//                                               .font(.subheadline)
//                                               .bold()
//                                           Text(activity.description)
//                                               .font(.caption)
//                                               .foregroundColor(.gray)
//                                       }
//                                       Spacer()
//                                       Text(activity.date, style: .time) // Displays time like "12:34 PM"
//                                           .font(.caption)
//                                           .foregroundColor(.secondary)
//                                   }
//                                   .padding(.horizontal)
//                                   Divider() // Adds a line between activity items
//                               }
//                        
//                        
//                        
//
//                        ActivityChartView() // Chart is here
//                            .frame(height: 200)
//                            .padding()
//                    }
//                }
//            }
//            .navigationTitle("Dashboard")
//        }
//    }
//}
//
//struct DashboardCard: View {
//    var title: String
//    var value: String
//    
//    var body: some View {
//        VStack {
//            Text(title)
////                .font(.caption)
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            Text(value)
//                .font(.title)
//                .bold()
//        }
//        .frame(maxWidth: .infinity)
//        .padding()
//        .background(Color.gray.opacity(0.2))
//        .cornerRadius(4)
//    }
//}
//    
//
//// Lead Tab
//struct Leadview: View {
//    var body: some View {
//        
//        
//        NavigationView {
//            List {
//                LeadRow(name: "John Doe", status: "Active")
//                LeadRow(name: "Jane Smith", status: "Pending")
//            }
//            .navigationTitle("Active Leads")
//        }
//    }
//}
//
//
//struct LeadRow: View {
//    var name: String
//    var status: String
//    
//    var body: some View {
//        HStack {
//            Text(name)
//            Spacer()
//            Text(status)
//                .foregroundColor(status == "Active" ? .green : .orange)
//        }
//    }
//}
//
//// Task Tab
//struct TaskTab: View {
//    var body: some View {
////        NavigationView {
//            TaskListView()
////        }
//    }
//}
//
//
//// Notification Tab
//struct NotificationTab: View {
//    var body: some View {
//        NotificationView()
//    }
//        
////        .title("Notification")
//}
//// Account Tab
//struct AccountTab: View {
//    var body: some View {
//        NavigationView {
//            AccountView()
//        }
//        .padding()
//        .navigationTitle("Account Settings")
//    }
//}
//
//// Preview
//struct DashboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardView()
//    }
//}
//
//struct ActivityChartView: View {
//    // Sample data for the chart
//    let activityData: [Activity] = [
//        Activity(day: "Mon", tasks: 5),
//        Activity(day: "Tue", tasks: 8),
//        Activity(day: "Wed", tasks: 3),
//        Activity(day: "Thu", tasks: 6),
//        Activity(day: "Fri", tasks: 4),
//        Activity(day: "Sat", tasks: 7),
//        Activity(day: "Sun", tasks: 2)
//    ]
//    
//    var body: some View {
//        Chart(activityData) { dataPoint in
//            BarMark(
//                x: .value("Day", dataPoint.day),
//                y: .value("Tasks", dataPoint.tasks)
//            )
//            .foregroundStyle(Color.blue)
//        }
//        .chartXAxis {
//            AxisMarks(position: .bottom, values: .automatic)
//        }
//        .chartYAxis {
//            AxisMarks(position: .leading)
//        }
//    }
//}
//    
//    struct RecentActivity: Identifiable {
//        let id = UUID()
//        let title: String
//        let description: String
//        let date: Date
//    }
//    let recentActivities: [RecentActivity] = [
//        RecentActivity(
//            title: "Task Completed",
//            description: "You completed the task 'Prepare Sales Report'",
//            date: Date().addingTimeInterval(-3600) // 1 hour ago
//        ),
//        RecentActivity(
//            title: "New Task Assigned",
//            description: "You were assigned the task 'Follow up with Client A'",
//            date: Date().addingTimeInterval(-7200) // 2 hours ago
//        ),
//        RecentActivity(
//            title: "New Lead Arrived",
//            description: "New lead: 'John Doe from XYZ Company'",
//            date: Date().addingTimeInterval(-10800) // 3 hours ago
//        ),
//        RecentActivity(
//            title: "Task Created",
//            description: "You created the task 'Organize Team Meeting'",
//            date: Date().addingTimeInterval(-14400) // 4 hours ago
//        )
//    ]
//// Activity Model
//struct Activity: Identifiable {
//    let id = UUID()
//    let day: String
//    let tasks: Int
//}
////





import SwiftUI
import Charts

// Main Dashboard View with TabView
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
        .onAppear {
            setupTabBarAppearance()
//            setupNavigationBarAppearance()
        }
    }
}

// MARK: - Home Tab
struct HomeTab: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Welcome Section
                    HStack {
                        Text("Welcome, John!")
                            .font(.headline)
                            .padding()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Dashboard Cards
                    HStack {
                        DashboardCard(title: "CurrentTask", value: "0")
                        DashboardCard(title: "Total Leads", value: "124")
                        DashboardCard(title: "Total Tasks", value: "58")
                    }
                    .padding(.horizontal)
                    Spacer()
                    
                    Section(header: Text("Activity Feed")
                        .font(.title3)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)) {
                        VStack(spacing: 12) {

                            NavigationLink(destination: AddTaskView()) {
                                AccountRow(title: "Create Task", icon: "plus")
                            }

                            NavigationLink(destination: Leadview()) {
                                AccountRow(title: "Active Leads", icon: "person.2")
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    
                    ActivityChartView()
                        .frame(height: 200)
                        .padding()
                    
                    Spacer()
                    
                    // Recent Activities Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Recent Activities")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                        
                        
                        Spacer()
                        // Activity List
                        ForEach(recentActivities) { activity in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(activity.title)
                                        .font(.subheadline)
                                        .bold()
                                    Text(activity.description)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(activity.date, style: .time) // Displays time, e.g., "12:34 PM"
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal)
                            Divider() // Adds a line between activity items
                        }
                    }
                    
                    
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

// MARK: - Dashboard Card View
struct DashboardCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            Text(value)
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(hex:"#629f42").opacity(0.4))
        .cornerRadius(8)
    }
}

// MARK: - Lead View
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

// MARK: - Task Tab
struct TaskTab: View {
    var body: some View {
        Text("Task Tab") // Placeholder for Task Tab
    }
}

// MARK: - Notification Tab
struct NotificationTab: View {
    var body: some View {
        Text("Notification Tab") // Placeholder for Notification Tab
    }
}

// MARK: - Account Tab
struct AccountTab: View {
    var body: some View {
        NavigationView {
            Text("Account Settings") // Placeholder for Account Tab
                .navigationTitle("Account Settings")
        }
    }
}

// MARK: - Activity Chart View
struct ActivityChartView: View {
    let activityData: [Activity] = [
        Activity(day: "Mon", tasks: 5),
        Activity(day: "Tue", tasks: 8),
        Activity(day: "Wed", tasks: 3),
        Activity(day: "Thu", tasks: 6),
        Activity(day: "Fri", tasks: 4),
        Activity(day: "Sat", tasks: 7),
        Activity(day: "Sun", tasks: 2)
    ]
    
    var body: some View {
        Chart(activityData) { dataPoint in
            LineMark(
                x: .value("Day", dataPoint.day),
                y: .value("Tasks", dataPoint.tasks)
            )
            .foregroundStyle(Color(hex:"#629f42"))
            .symbol {
                Circle()
                    .fill(Color(hex:"#629f42")) // Use `.fill` to create a proper View
                    .frame(width: 10, height: 10) // Customize size
            }
        }
        .chartXAxis {
            AxisMarks(position: .bottom)
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
    }
}


// MARK: - Models
struct Activity: Identifiable {
    let id = UUID()
    let day: String
    let tasks: Int
}

struct RecentActivity: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let date: Date
}

let recentActivities: [RecentActivity] = [
    RecentActivity(
        title: "Task Completed",
        description: "You completed the task 'Prepare Sales Report'",
        date: Date().addingTimeInterval(-3600) // 1 hour ago
    ),
    RecentActivity(
        title: "New Task Assigned",
        description: "You were assigned the task 'Follow up with Client A'",
        date: Date().addingTimeInterval(-7200) // 2 hours ago
    ),
    RecentActivity(
        title: "New Lead Arrived",
        description: "New lead: 'John Doe from XYZ Company'",
        date: Date().addingTimeInterval(-10800) // 3 hours ago
    ),
    RecentActivity(
        title: "Task Created",
        description: "You created the task 'Organize Team Meeting'",
        date: Date().addingTimeInterval(-14400) // 4 hours ago
    )
]

private func setupTabBarAppearance() {
    let tabBarAppearance = UITabBarAppearance()
    tabBarAppearance.configureWithOpaqueBackground()
    tabBarAppearance.backgroundColor = UIColor(hex: "#629f42")

    tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.7)
    tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
        .foregroundColor: UIColor.white.withAlphaComponent(0.7)
    ]
    tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
    tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
        .foregroundColor: UIColor.white
    ]

    UITabBar.appearance().standardAppearance = tabBarAppearance
    if #available(iOS 14.0, *) {
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}

// MARK: - Preview
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
