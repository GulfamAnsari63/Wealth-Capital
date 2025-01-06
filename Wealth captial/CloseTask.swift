
import SwiftUI

struct CloseTask: View {
    @State private var taskName: String = ""
    @State private var assignee: String = ""
    @State private var tagMember: String = ""
    @State private var dueDate = Date()
    @State private var isDueTimeEnabled: Bool = false
    @State private var selectedPriority: Priority = .medium
    @State private var isAttachmentRequired: Bool = false
    @State private var descriptionText: String = ""

    enum Priority: String, CaseIterable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
    
private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy hh:mm a"
        return formatter
}

    private func formattedDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    var body: some View {
        NavigationView {
            VStack {
                // Task Name
                VStack(alignment: .leading) {
                    ZStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "pin.fill")
                                .foregroundColor(Color(hex: "#6ca44c"))
                            if taskName.isEmpty {
                                Text("Your Location")
                                    .foregroundColor(.black)
                                    .padding(.leading, 5)
                            }
                        }
                        TextField("", text: $taskName)
                            .padding(.bottom, 8)
                            .padding(.leading, 5)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.gray),
                                alignment: .bottom
                            )
                    }
                }
                
                // Due Date & Time Section
                VStack {
                    HStack{
                            HStack {
                                Image(systemName: "clock" )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20) // Small clock icon
                                    .foregroundColor(Color(hex:"#6ca44c"))
                                
//                                Spacer()
                                Text("Time")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading,0)
                            
                            // Display the full date and time (formatted)
                            Spacer()
                        
                            Text(formattedDate(dueDate))
                                .font(.body)
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                                .padding(.top, 5)
                        }
//                        Spacer()
                    }
//                    .padding(.vertical, 10)
//                }
//                .padding(.horizontal)
                
                Divider()
                    .background(Color.black)

                // Attachment Section
                HStack {
                    Text("Upload")
                        .foregroundColor(.black)
                    Image(systemName: "paperclip")
                        .foregroundColor(Color(hex: "#6ca44c"))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Divider()
                    .background(Color.black)

                // Description
                VStack(alignment: .leading) {
                    Text("Remark")
                        .font(.headline)
                    ZStack(alignment: .topLeading) {
                        if descriptionText.isEmpty {
                            Text("Write here...")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 4)
                                .padding(.top, 2)
                        }
                    }
                    TextEditor(text: $descriptionText)
                        .frame(height:120)
                        .padding(.horizontal, 4)
                        .background(Color.clear)
                        .overlay(
                            VStack {
                                Divider()
                                    .background(Color.black)
                            }
                        )
                        .padding(.vertical, 1)
                }

                // Close Task Button
                Spacer()
                Button(action: {
                    // Handle Close Task action
                }) {
                    Text("Close Task")
                        .font(.headline)
                        .padding()
                        .background(Color(hex: "#6ca44c"))
                        .foregroundColor(.black)
                        .cornerRadius(24)
                }
                .padding(.top,10)
                .padding(.bottom, 30)
            }
            .padding()
            .navigationBarTitle("Close Task")
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
struct CloseTask_Previews: PreviewProvider {
    static var previews: some View {
        CloseTask()
    }
}
