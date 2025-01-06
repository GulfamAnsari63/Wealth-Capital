
import SwiftUI

struct TaskDetail: View {
    @State private var Purchase: String = ""
    @State private var DxterCrew: String = ""
    @State private var DxCrew: String = ""
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
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                VStack(alignment: .leading) {
                    HStack{
                        ZStack(alignment: .leading) {
                            if Purchase.isEmpty {
                                Text("Purchase")
                                    .foregroundColor(.black)
                                    .padding(.leading, 3) // Adjust padding as needed
                            }
                            
                            TextField("", text: $Purchase)
                                .padding(.bottom, 8)
                                .padding(.leading, 5) // Adjust padding as needed
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.gray),
                                    alignment: .bottom
                                )
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack{
                        ZStack(alignment: .leading) {
                            if DxterCrew.isEmpty {
                                Text("Dexter Crew ")
                                    .foregroundColor(.black)
                                    .padding(.leading, 3) // Adjust padding as needed
                            }
                            TextField("", text: $DxterCrew)
                                .padding(.bottom, 8)
                                .padding(.leading, 5) // Adjust padding as needed
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.gray),
                                    alignment: .bottom
                                )
                        }
                        Button(action:{
                            print("Play icon tapped!")
                        }){
                            Image("Image 23")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height:20)
                                
                        }
                    }

                }
                
                // Tag member for notification
                VStack(alignment: .leading) {
                    //                    Text("Tag member for notification")
                    //                        .font(.headline)
                    HStack {
                        ZStack(alignment: .leading) {
                            if tagMember.isEmpty {
                                Text("Tag member for notification")
                                    .foregroundColor(.black)
                                    .padding(.leading, 3) // Adjust padding as needed
                            }
                            
                            TextField("", text: $tagMember)
                                .padding(.bottom, 8)
                                .padding(.leading, 5) // Adjust padding as needed
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.gray),
                                    alignment: .bottom
                                )
                        }
                        
                        Button(action: {
                            // Add your action here
                            print("Play icon tapped!")
                        }) {
                            Image("Image 23")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20,height:20)
                                
                        }
                        .buttonStyle(PlainButtonStyle()) // Ensures the button doesn't get extra padding or styling
                    }
                }
                VStack(alignment: .leading) {
                    HStack{
                        ZStack(alignment: .leading) {
                            if DxCrew.isEmpty {
                                Text("Dexter Crew")
                                    .foregroundColor(.black)
                                    .padding(.leading, 3) // Adjust padding as needed
                            }
                            
                            TextField("", text: $DxCrew)
                                .padding(.bottom, 8)
                                .padding(.leading, 5) // Adjust padding as needed
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.gray),
                                    alignment: .bottom
                                )
                            
                        }
                    }
                }
                
                // Due Date & Time
                HStack {
                    // DatePicker for Due Date
                    VStack(alignment: .leading) {
                        DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                            .labelsHidden()
                        
                    }
                    Spacer()
                    //                    Divider()
                    //                    Spacer()
                    // Custom Checkbox for Due Time
                    Button(action: {
                        isDueTimeEnabled.toggle()
                    }) {
                        HStack {
                            Image(systemName: isDueTimeEnabled ? "checkmark.square" : "square")
                                .foregroundColor(Color(hex:"#629f42"))
                            Text("Due Time")
                                .foregroundColor(.black)
                            //                                        .padding(.vertical, 1)
                        }
                    }
                    .buttonStyle(PlainButtonStyle()) // To prevent default button styling
                }
                //                .padding(.horizontal)
                .padding(.horizontal, 8) // Reduce horizontal padding for the entire HStack
                .padding(.vertical, 6)
                
                
                Divider()
                    .background(Color.black)
                
                // Priority
                HStack(alignment: .center, spacing: 8) {
                    Text("Priority")
                    //                        .font(.headline)
                    
                    Spacer()
                    
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Button(priority.rawValue) {
                            selectedPriority = priority
                        }
                        .padding(.vertical, 6) // Reduced padding
                        .padding(.horizontal, 10)
                        .background(selectedPriority == priority ? Color(hex:"#629f42") : Color.gray.opacity(0.2))
                        .foregroundColor(selectedPriority == priority ? .white : .gray)
                        .font(.caption) // Smaller font size
                        //                        .cornerRadius(8)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .background(Color.black)
                
                //                 Upload
                HStack (alignment: .center, spacing: 8){
                    Text("Upload")
                        .foregroundColor(.black)
                    Image(systemName: "paperclip")
                        .foregroundColor(Color(hex:"#629f42"))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .background(Color.black)
                // Attachment Requirement
                HStack {
                    Text("Attachment is required when closing a task?")
                        .padding(.horizontal,3)
                    Spacer()
                    HStack(spacing: 16) {
                        Button(action: {
                            isAttachmentRequired = true
                        }) {
                            Text("Yes")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 14)
                                .background(isAttachmentRequired ? Color(hex:"#629f42") : Color.gray.opacity(0.2))
                                .foregroundColor(isAttachmentRequired ? .white : .gray)
                            //                                    .cornerRadius(8)
                        }
                        //                        Spacer()
                        
                        Button(action: {
                            isAttachmentRequired = false
                        }) {
                            Text("No")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 14)
                                .background(!isAttachmentRequired ? Color.red : Color.gray.opacity(0.2))
                                .foregroundColor(!isAttachmentRequired ? .white : .gray)
                            //                                    .cornerRadius(8)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .background(Color.black)
                
                // Description
                VStack(alignment: .leading) {
                    Text("Description")
                    //                        .font(.headline)
                    
                    ZStack(alignment: .topLeading) {
                        if descriptionText.isEmpty {
                            Text("Write here...")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 4)  //Align with TextEditor padding
                                .padding(.top,2)
                        }
                    }
                    
                    TextEditor(text: $descriptionText)
                        .padding(.horizontal, 4) // Adds some padding for text inside the editor
                        .background(Color.clear) // Ensures no background color for the editor
                        .overlay(
                            VStack {
                                //                                       Divider() Top line
                                //                                       Spacer()
                                Divider() // Bottom line
                                    .background(Color.black)
                            }
                        )
                        .padding(.vertical, 1) // Adds spacing for the lines
                    //                        .padding(.top, 8)
                }
                
                // Add Task Button
//                Spacer()
                
                HStack{
                    NavigationLink(destination: CloseTask()) {
                        Text("Close Task")
                            .font(.headline)
                        //                        .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex:"#629f42"))
                            .foregroundColor(.black)
                            .cornerRadius(24)
                    }
                    .padding(.bottom)
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle Add Task action
                    }) {
                        Text("Update Task")
                            .font(.headline)
                        //                        .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex:"#629f42"))
                            .foregroundColor(.black)
                            .cornerRadius(24)
                    }
                    .padding(.bottom)
                }
                .padding(.horizontal, 16)
//                .padding(.top,30)
            }
            .padding()
//            .navigationBarTitle("Task Detail")
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

struct TaskDetailView_Preview: PreviewProvider {
    static var previews: some View {
        TaskDetail()
    }
}
