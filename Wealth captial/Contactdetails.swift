
import SwiftUI

struct ContactsView: View {
    var body: some View {
        NavigationView {
//            .padding()
            VStack(alignment: .leading, spacing: 0) {
                // Contact Header
                HStack{
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Harper Williams")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("harper22 @zyler.com")
//                            .font(.subheadline)
//                            .font(.title3)
                            .foregroundColor(.black)
                        Text("5555555555")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray.opacity(0.4))
//                        .cornerRadius(8)
                }
                .padding()
                Divider()
                    .background(Color.black)
                    .padding()
                // Account Section
                VStack {
                    Text("Zylker")
                        .font(.headline)
                        .foregroundColor(.blue)
//                    Spacer()
                    Text("Account")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom, 8)

              

                // Tabs for Related, Email, Details
                HStack(spacing: 0) {
                    TabButton(title: "Related", isSelected: true)
                    TabButton(title: "Email", isSelected: false)
                    TabButton(title: "Details", isSelected: false)
                    
                        
                }
//                .foreground(Color.black)
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.white)
                        
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                )
                .padding(.horizontal)
                .padding()
                .padding(.horizontal)
//                .padding(.bottom, 16)

                Divider()
//                Spacer()

//

                // Notes Section
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "Notes")
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        NoteItem(title: "Document-Checklist", size: "3.70 MB - Yet to be downloaded", time: "13m", by: "John Nash")
                        Divider()
                            .background(Color.black)
                        NoteItem(title: "Fix an appointment with Katia", size: nil, time: "15m", by: "John Nash")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    )
                    .padding(.horizontal)
                }
                .padding(.vertical)
                
                    // Attachments Section
                    SectionHeader(title: "Attachment")
//                                        .padding()
                    AttachmentItem(fileName: "Product Specification.pdf", by: "John Nash")
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(
                            RoundedRectangle(cornerRadius: 0)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        )
                        .padding()
          

                // Opportunities Section
                SectionHeader(title: "Opportunities")
                    
//                Divider()
//                    .background(Color.black)
//                    .padding(.vertical, 6)
                OpportunityItem(company: "Zylker",
                                proposal: "$15,000.00", date: "Oct 11, 2019")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                )
//                .padding(.vertical)
                .padding()
            
                // Tasks Section (Optional Placeholder for Consistency)
//                SectionHeader(title: "Tasks")
////                    .padding()
//                Text("Email") // Placeholder task
//                    .font(.subheadline)
//                    .padding()
//                    .foregroundColor(.blue)
//                    .background(
//                        RoundedRectangle(cornerRadius: 0)
//                            .fill(Color.white)
//                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 3)
//                    )
////                    .padding()
//                    .padding(.vertical)
//                    .padding(.horizontal)

//                Spacer()
            }
            
//            .navigationTitle("Contacts")
            
        }
    }
}

// Tab Button
struct TabButton: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(isSelected ? .black: .gray)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.gray.opacity(0.1) : Color.clear)
//            .cornerRadius(8)
    }
}

// Section Header
struct SectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.leading)
            .padding(.bottom, 4)
    }
}

// Note Item
struct NoteItem: View {
    let title: String
    let size: String?
    let time: String
    let by: String

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .stroke(Color.green, lineWidth: 2)
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                if let size = size {
                    Text(size)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                Text("\(time) ago by \(by)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()

            Image(systemName: "arrow.down.to.line")
                .foregroundColor(.blue)
        }
    }
}

// Attachment Item
struct AttachmentItem: View {
    let fileName: String
    let by: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "doc.text.fill")
                .foregroundColor(.red)
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text(fileName)
                    .font(.subheadline)
                Text(by)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()

            Image(systemName: "plus")
                .foregroundColor(.blue)
        }
    }
}

// Opportunity Item
struct OpportunityItem: View {
    let company: String
    let proposal: String
    let date: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                //                    .padding(.trailing, 8)
                
                Text(company)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            HStack {
                Text("Proposal:")
                    .foregroundColor(.gray)
                Spacer()
                Text(proposal)
            }
                
                Text(date)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}


