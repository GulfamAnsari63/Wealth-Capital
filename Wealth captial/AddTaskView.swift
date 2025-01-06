//
//import SwiftUI
//
//struct AddTaskView: View {
//    @State private var taskName: String = ""
//    @State private var assignee: String = ""
//    @State private var tagMember: String = ""
//    @State private var dueDate = Date()
//    @State private var isDueTimeEnabled: Bool = false
//    @State private var selectedPriority: Priority = .medium
//    @State private var isAttachmentRequired: Bool = false
//    @State private var descriptionText: String = ""
//    @State private var isDropdownVisible: Bool = false
//
//    enum Priority: String, CaseIterable {
//        case low = "Low"
//        case medium = "Medium"
//        case high = "High"
//    }
//    private var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MMM/yyyy"
//        return formatter
//    }
//    private func formattedDate(_ date: Date) -> String {
//        return dateFormatter.string(from: date)
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 10) {
//                // Task Name
////                VStack(alignment: .leading) {
////                    TextField("Enter task name", text: $taskName)
////                        .textFieldStyle(RoundedBorderTextFieldStyle())
////                }
//                VStack(alignment: .leading) {
//                    HStack{
//                        ZStack(alignment: .leading) {
//                            if taskName.isEmpty {
//                                Text("Task Name ")
//                                    .foregroundColor(.black)
//                                    .padding(.leading, 5) // Adjust padding as needed
//                            }
//                            
//                            TextField("", text: $taskName)
//                                .padding(.bottom, 8)
//                                .padding(.leading, 5) // Adjust padding as needed
//                                .overlay(
//                                    Rectangle()
//                                        .frame(height: 1)
//                                        .foregroundColor(.gray),
//                                    alignment: .bottom
//                                )
//                            
//                        }
////                        TextField("Task Name", text: $taskName)
////                            .foregroundColor(.black)
////                            .padding(.bottom, 8)
////                            .overlay(
////                                Rectangle()
////                                    .frame(height: 1)
////                                    .foregroundColor(.gray),
////                                alignment: .bottom
////                            )
////                        Image(systemName: "play.fill") // Arrow icon
////                            .foregroundColor(.green)
////                            .rotationEffect(.degrees(90))
////                            .padding(.leading, 8)
////                                
//                    }
//                }
//             
//
//                // Assign to
//                VStack(alignment: .leading) {
//                    HStack{
//                        ZStack(alignment: .leading) {
//                            if assignee.isEmpty {
//                                Text("Assign to ")
//                                    .foregroundColor(.black)
//                                    .padding(.leading, 5) // Adjust padding as needed
//                            }
//                            
//                            TextField("", text: $assignee)
//                                .padding(.bottom, 8)
//                                .padding(.leading, 5) // Adjust padding as needed
//                                .overlay(
//                                    Rectangle()
//                                        .frame(height: 1)
//                                        .foregroundColor(.gray),
//                                    alignment: .bottom
//                                )
//                            
//                        }
//                        Button(action:{
//                            isDropdownVisible.toggle()
//                            print("Play icon tapped!")
//                        }){
//                            Image("Image 23")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width:20,height:20)
//                        }
//                        }
//                    if isDropdownVisible {
//                        VStack(spacing: 10) {
//                            Button(action: {
//                                assignee = "Option 1"
//                                isDropdownVisible = false
//                            }) {
//                                Text("Option 1")
//                                    .foregroundColor(.black)
////                                    .padding()
//                                    .overlay(
//                                        Rectangle()
//                                            .frame(height: 1)
//                                            .foregroundColor(.gray),
//                                        alignment: .bottom
//                                    )
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                   
//                            }
//                        
//                        }
//                        .padding(.top, 10)
//                                
//                    }
//                    
//                }
//
//                // Tag member for notification
//                VStack(alignment: .leading) {
//                    HStack {
//                        ZStack(alignment: .leading) {
//                            if tagMember.isEmpty {
//                                Text("Tag member for notification")
//                                    .foregroundColor(.black)
//                                    .padding(.leading, 5) // Adjust padding as needed
//                            }
//                            
//                            TextField("", text: $tagMember)
//                                .padding(.bottom, 8)
//                                .padding(.leading, 5) // Adjust padding as needed
//                                .overlay(
//                                    Rectangle()
//                                        .frame(height: 1)
//                                        .foregroundColor(.gray),
//                                    alignment: .bottom
//                                )
//                        }
//                        
//                        Button(action: {
//                            // Add your action here
//                            print("Play icon tapped!")
//                        }) {
//                            Image("Image 23")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width:20,height:20)
//                        }
//                        .buttonStyle(PlainButtonStyle()) // Ensures the button doesn't get extra padding or styling
//                    }
//                }
//
//                // Due Date & Time
//                HStack {
//                        
//                            VStack(alignment: .leading) {
//                                DatePicker(formattedDate(dueDate), selection: $dueDate, displayedComponents: .date)
////                                    .labelsHidden()
//                                
//                            }
//                    Spacer()
//                    Divider()
//                        .background(Color.black)
//                        .padding(.vertical)
//                        .padding(.horizontal)
////                    Spacer()
//                            // Custom Checkbox for Due Time
//                            Button(action: {
//                                isDueTimeEnabled.toggle()
//                            }) {
//                                HStack {
//                                    Image(systemName: isDueTimeEnabled ? "checkmark.square" : "square")
//                                        .foregroundColor(Color(hex:"#629f42"))
//                                    Text("Due Time")
//                                        .foregroundColor(.black)
////                                        .padding(.vertical, 1)
//                                }
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                        }
////                .padding(.horizontal)
//                .padding(.horizontal, 8) // Reduce horizontal padding for the entire HStack
//                        .padding(.vertical, 6)
//                    
//                
//                Divider()
//                    .background(Color.black)
//
//                // Priority
//                HStack(alignment: .center, spacing: 8) {
//                    Text("Priority")
////                        .font(.headline)
//                    
//                    Spacer()
//                    
//                    ForEach(Priority.allCases, id: \.self) { priority in
//                        Button(priority.rawValue) {
//                            selectedPriority = priority
//                        }
//                        .padding(.vertical, 6) // Reduced padding
//                        .padding(.horizontal, 10)
//                        .background(selectedPriority == priority ? Color(hex:"#629f42") : Color.gray.opacity(0.2))
//                        .foregroundColor(selectedPriority == priority ? .black : .black)
//                        .font(.caption) // Smaller font size
////                        .cornerRadius(8)
//                    }
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//
//            Divider()
//                    .background(Color.black)
//
////                 Upload
//                HStack (alignment: .center, spacing: 8){
//                    Text("Upload")
//                        .foregroundColor(.black)
//                    Image(systemName: "paperclip")
//                        .foregroundColor(Color(hex:"#629f42"))
//
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                Divider()
//                    .background(Color.black)
//                // Attachment Requirement
//                HStack {
//                    Text("Attachment is required when closing a task?")
//                    .padding(.horizontal)
//                    Spacer()
//                    HStack(spacing: 16) {
//                            Button(action: {
//                                isAttachmentRequired = true
//                            }) {
//                                Text("Yes")
//                                    .padding(.vertical, 7)
//                                    .padding(.horizontal, 14)
//                                    .background(isAttachmentRequired ? Color(hex:"#62f42") : Color.gray.opacity(0.2))
//                                    .foregroundColor(isAttachmentRequired ? .black : .black)
////                                    .cornerRadius(8)
//                            }
////                        Spacer()
//
//                            Button(action: {
//                                isAttachmentRequired = false
//                            }) {
//                                Text("No")
//                                    .padding(.vertical, 7)
//                                    .padding(.horizontal, 14)
//                                    .background(!isAttachmentRequired ? Color(hex:"#629f42") : Color.gray.opacity(0.2))
//                                    .foregroundColor(!isAttachmentRequired ? .black : .black)
////                                    .cornerRadius(8)
//                            }
//                        }
//
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                Divider()
//                    .background(Color.black)
//
//                // Description
//                VStack(alignment: .leading) {
//                    Text("Description")
////                        .font(.headline)
//                
//                    ZStack(alignment: .topLeading) {
//                        if descriptionText.isEmpty {
//                            Text("Write here...")
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 4)
//                                .padding(.top,2)
//                        }
//                    }
//                    
//                    TextEditor(text: $descriptionText)
//                        .padding(.horizontal, 4)
//                               .background(Color.clear) // Ensures no background color for the editor
//                               .overlay(
//                                   VStack {
////                                       Divider() Top line
////                                       Spacer()
//                                       Divider() // Bottom line
//                                           .background(Color.black)
//                                   }
//                               )
//                               .padding(.vertical, 1)
////                        .padding(.top, 8)
//                }
//
//                // Add Task Button
//                Spacer()
//                Button(action: {
//                   
//                }) {
//                    Text("Add Task")
//                        .font(.headline)
////                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color(hex:"#629f42"))
//                        .foregroundColor(.black)
//                        .cornerRadius(24)
//                }
//                .padding(.bottom, 60)
//            }
//            .padding()
////            .navigationBarTitle("Add Task")
////            .frame(maxWidth: .infinity, alignment: .leading)
//            
//        }
//    }
//}
//
//struct AddTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskView()
//    }
//}



import SwiftUI

struct AddTaskView: View {
    @State private var taskName: String = ""
    @State private var assignee: String = ""
    @State private var tagMember: String = ""
    @State private var dueDate = Date()
    @State private var isDueTimeEnabled: Bool = false
    @State private var selectedPriority: Priority = .medium
    @State private var isAttachmentRequired: Bool = false
    @State private var descriptionText: String = ""
    @State private var isDropdownVisible: Bool = false
    @State private var isDropdownViible: Bool = false
    
    @State private var showDatePicker = false

    enum Priority: String, CaseIterable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MMM/yyyy"
        return formatter
    }
    
    private func formattedDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                // Task Name
                VStack(alignment: .leading) {
                    HStack{
                        ZStack(alignment: .leading) {
                            if taskName.isEmpty {
                                Text("Task Name ")
                                    .foregroundColor(.black)
                                    .padding(.leading, 5) // Adjust padding as needed
                            }
                            
                            TextField("", text: $taskName)
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
                
                // Assign to
                VStack(alignment: .leading) {
                    HStack{
                        ZStack(alignment: .leading) {
                            if assignee.isEmpty {
                                Text("Assign to ")
                                    .foregroundColor(.black)
                                    .padding(.leading, 5) // Adjust padding as needed
                            }
                            
                            TextField("", text: $assignee)
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
                            isDropdownVisible.toggle()
                            print("Play icon tapped!")
                        }){
                            Image("Image 23")
                                .resizable()
                                .scaledToFit()
                                .rotationEffect(.degrees(isDropdownVisible ? -180:0))
                                .frame(width:20,height:20)
                        }
                    }
                    if isDropdownVisible {
                        VStack(spacing: 10) {
                            Button(action: {
                                assignee = "Option 1"
                                isDropdownVisible = false
                            }) {
                                Text("Option 1")
                                    .foregroundColor(.black)
                                 
                            }
                        }
                        .padding(.top, 10)
                    }
                }
                
                // Tag member for notification
                VStack(alignment: .leading) {
                    HStack {
                        ZStack(alignment: .leading) {
                            if tagMember.isEmpty {
                                Text("Tag member for notification")
                                    .foregroundColor(.black)
                                    .padding(.leading, 5) // Adjust padding as needed
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
                            isDropdownViible.toggle()
                            print("Play icon tapped!")
                        }) {
                            Image("Image 23")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20,height:20)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                        if isDropdownViible {
                            VStack(spacing: 10) {
                                Button(action: {
                                    tagMember = "Option 8"
                                    isDropdownViible = false
                                }) {
                                    Text("Option 8")
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.top, 10)
                        }
                }
                
                // Due Date & Time
                HStack {
                    // Clock icon and formatted date
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(Color(hex:"#629f42"))
//                            .padding(.leading )
                            .onTapGesture {
                                showDatePicker.toggle() // Toggle the visibility of the date picker
                            }
                        
                        Text(formattedDate(dueDate))
                            .padding(.leading, 5)
                            .foregroundColor(.black)
                        //                                           .padding(.bottom, 8)
                        
                        
                    }
                    
                    Spacer()
                    
                    
                    // Show Date Picker if showDatePicker is true
                    if showDatePicker {
                        DatePicker("", selection: $dueDate, displayedComponents: .date)
                            .labelsHidden()
                        //                                       .datePickerStyle(WheelDatePickerStyle())
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(maxWidth: .infinity)
                            .padding(.top, 5)
                    }
                    
                    
                    // Custom Checkbox for Due Time
                    Button(action: {
                        isDueTimeEnabled.toggle()
                    }) {
                        HStack {
                            Image(systemName: isDueTimeEnabled ? "checkmark.square" : "square")
                                .foregroundColor(Color(hex:"#629f42"))
                            Text("Due Time")
                                .foregroundColor(.black)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            
                               .padding(.horizontal, 8)
                               .padding(.vertical, 6)
//
                Divider()
                    .background(Color.black)

                // Priority
                HStack(alignment: .center, spacing: 8) {
                    Text("Priority")
                    
                    Spacer()
                    
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Button(priority.rawValue) {
                            selectedPriority = priority
                        }
                        .padding(.vertical, 6) // Reduced padding
                        .padding(.horizontal, 10)
                        .background(selectedPriority == priority ? Color(hex:"#629f42") : Color.gray.opacity(0.2))
                        .foregroundColor(selectedPriority == priority ? .black : .black)
                        .font(.caption) // Smaller font size
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Divider()
                    .background(Color.black)

                // Upload
                Button(action:{
                    print("icon tapped!")
                }){
                    HStack (alignment: .center, spacing: 8){
                        Text("Upload")
                            .foregroundColor(.black)
                        
                        Image(systemName: "paperclip")
                            .foregroundColor(Color(hex:"#629f42"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                Divider()
                    .background(Color.black)

                
                // Attachment Requirement
                HStack {
                    Text("Attachment is required when closing a task?")
                        .padding(.vertical)
                    Spacer()
                    HStack(spacing: 16) {
                            Button(action: {
                                isAttachmentRequired = true
                            }) {
                                Text("Yes")
                                    .padding(.vertical, 7)
                                    .padding(.horizontal, 14)
                                    .background(isAttachmentRequired ? Color(hex:"#62f42") : Color.gray.opacity(0.2))
                                    .foregroundColor(isAttachmentRequired ? .black : .black)
                            }

                            Button(action: {
                                isAttachmentRequired = false
                            }) {
                                Text("No")
                                    .padding(.vertical, 7)
                                    .padding(.horizontal, 14)
                                    .background(!isAttachmentRequired ? Color(hex:"#629f42") : Color.gray.opacity(0.2))
                                    .foregroundColor(!isAttachmentRequired ? .black : .black)
                            }
                        }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .background(Color.black)

                // Description
                VStack(alignment: .leading) {
                    Text("Description")
                    ZStack(alignment: .topLeading) {
                        if descriptionText.isEmpty {
                            Text("Write here...")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 4)
                                .padding(.top, 2)
                        }
                    }
                    
                    TextEditor(text: $descriptionText)
                        .padding(.horizontal, 4)
                        .background(Color.clear) // Ensures no background color for the editor
                        .overlay(
                            VStack {
                               Divider() // Bottom line
                                   .background(Color.black)
                            }
                        )
                        .padding(.vertical, 1)
                }

                // Add Task Button
                Spacer()
                Button(action: {
                    // Add task action
                }) {
                    Text("Add Task")
                        .font(.headline)
                        .padding()
                        .background(Color(hex:"#629f42"))
                        .foregroundColor(.black)
                        .cornerRadius(24)
                }
                .padding(.bottom, 60)
            }
            .padding()
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
