
import SwiftUI

struct TaskListView: View {
    @State private var selectedTab: String = "Present"
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                Text("Tasks")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                
                // Tabs
                HStack {
                    Button(action: {
                        selectedTab = "Completed"
                    }) {
                        Text("Completed")
                            .bold(selectedTab == "Completed")
                            .foregroundColor(.black)
                            .padding(.bottom, 6)
                    }
                    Spacer()
                    Button(action: {
                        selectedTab = "Present"
                    }) {
                        Text("Present")
                            .bold(selectedTab == "Present")
                            .foregroundColor(.black)
                            .padding(.bottom, 6)
                    }
                    Spacer()
                    Button(action: {
                        selectedTab = "Upcoming"
                    }) {
                        Text("Upcoming")
                            .bold(selectedTab == "Upcoming")
                            .foregroundColor(.black)
                            .padding(.bottom, 6)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
               
                
                
                //underline
                Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.gray)
                                        .padding(.horizontal)
//                                        .padding(.top, 2)
                                        .offset(x: selectedTab == "Completed" ? UIScreen.main.bounds.width / 3 * -1 :
                                                                            selectedTab == "Present" ? 0 : UIScreen.main.bounds.width / 3)
                // List of tasks in individual
                ScrollView {
                    VStack(spacing: 15) {
                        TaskRow(name: "Jeremy Morgan", company: "ACME Corp, LA", assignedBy: "Dexter Crew", time: "10:00 AM - 6:00 PM", priority: "High")
                        TaskRow(name: "Armen Jake", company: "ACME Corp, LA", assignedBy: "Dexter Crew", time: "10:00 AM - 6:00 PM", priority: "Low")
                        TaskRow(name: "Sara Oliver", company: "ACME Corp, LA", assignedBy: "Dexter Crew", time: "10:00 AM - 6:00 PM", priority: "Medium")
                        TaskRow(name: "Harry Lios", company: "ACME Corp, LA", assignedBy: "Dexter Crew", time: "10:00 AM - 6:00 PM", priority: "High")
                        TaskRow(name: "Jeremy Morgan", company: "ACME Corp, LA", assignedBy: "Dexter Crew", time: "10:00 AM - 6:00 PM", priority: "Medium")
                        TaskRow(name: "Harry Lios", company: "ACME Corp, LA", assignedBy: "Dexter Crew", time: "10:00 AM - 6:00 PM", priority: "High")
                        TaskRow(name: "Jeremy Morgan", company: "ACME Corp, LA", assignedBy: "Dexter Crew", time: "10:00 AM - 6:00 PM", priority: "Medium")
                    }
                    .padding(.horizontal)
                }
                // Floating Plus Button
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(destination: AddTaskView()){
                                Image("Image")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:50,height:50)
//
                            }
                            .padding()
                        }
                    }
                )
            }
        }
    }
}

struct TaskRow: View {
    let name: String
    let company: String
    let assignedBy: String
    let time: String
    let priority: String
    @State private var isClosed: Bool = false

    var body: some View {
//        Button(action: {
            // Navigate to task details
            NavigationLink(destination: TaskDetail()){
             
                VStack(alignment: .leading) {
                    HStack {
                        Text(name)
                            .font(.headline)
                        Spacer()
                        HStack {
                            Image("Image 16")
                                .resizable()
                                .scaledToFit()  // Adjusts the image to fit within the given frame
                                .frame(width: 20, height: 20)
//                                .foregroundColor(.green)
                            Image("Image 15")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20,height:20)
//                                .foregroundColor(.green)
                            Image( "Image 17")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20,height:20)
//                                .foregroundColor(.green)
                        }
                    }
                    Text("Marketing Executive")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack{
                        Text(company)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(time)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Assigned By: \(assignedBy)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
//                        Spacer()
//                        Text(time)
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                    }
//                    HStack {
                        Spacer()
                        Text(priority)
                            .font(.footnote)
                            .bold()
                            .padding(.horizontal, 6)
                            .padding(.vertical, 4)
                            .background(priorityColor(priority))
                            .foregroundColor(.white)
                        Button(action: {
                            isClosed.toggle() // Handle the close action
                        }) {
                            Image(systemName: "xmark.rectangle")
                                .foregroundColor(.secondary)
                                .font(.title)
                            
                        }
                    }
                }
//                .padding()
                .padding(.vertical, 4)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.4), radius: 3, x: 0, y: 3)
                
            }
            
            .buttonStyle(PlainButtonStyle())
        }
    
               

    func priorityColor(_ priority: String) -> Color {
        switch priority {
        case "High":
            return .red
        case "Medium":
            return .red
        case "Low":
            return .green
        default:
            return .gray
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
