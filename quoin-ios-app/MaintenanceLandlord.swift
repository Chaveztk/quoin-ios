




import SwiftUI

struct MaintenanceView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    HStack {
                        Button(action: {
                            // Add action for the back button
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 20)
                        
                        Spacer() // Add spacer before the text
                        
                        VStack {
                            Text("1 Canary Wharf")
                                .font(.headline)
                            Text("E14 5DR")
                                .font(.subheadline)
                        }
                        
                        Spacer() // Add spacer after the text
                        
                        Button(action: {
                            // Add action for the plus button
                        }) {
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) { // Adjust the spacing between photos as needed
                            VStack {
                                HStack {
                                    Text("Before")
                                        .padding(.leading)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width - 40, height: 200) // Adjust width as needed
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                            VStack {
                                HStack {
                                    Text("After")
                                        .padding(.leading)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width - 40, height: 200) // Adjust width as needed
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                            // Add more images as needed
                        }
                        .padding(.vertical) // Add vertical padding to the HStack
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        InfoSection(title: "Description", imageName: "exclamationmark.triangle.fill", color: .black, text: "This is a description of the issue, 11:35 a.m.")
                        InfoSection(title: "Reported Date", imageName: "calendar", color: .blue, text: "April 13, 2024, 11:35 a.m.")
                        InfoSection(title: "Contractor", imageName: "wrench.and.screwdriver", color: .orange, text: "Plumbing Ltd")
                        InfoSection(title: "Resolution Date", imageName: "calendar.badge.checkmark", color: .green, text: "April 13, 2024, 11:43 a.m.")
                        InfoSection(title: "Cost", imageName: "dollarsign.circle", color: .purple, text: "£1000.00")
                        InfoSection(title: "Status", imageName: "checkmark.circle.fill", color: .green, text: "Closed")
                    }
                    .padding(.horizontal, 10)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct InfoSection: View {
    let title: String
    let imageName: String
    let color: Color
    let text: String
    @State private var isExpanded: Bool = false
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            InfoRow(imageName: imageName, color: color, text: text)
                .padding()
        } label: {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(color)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
                    .foregroundColor(.primary)
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(8)
        }
    }
}

struct InfoRow: View {
    let imageName: String
    let color: Color
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(color)
            Text(text)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    MaintenanceView()
}

