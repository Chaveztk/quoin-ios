//
//  Leftsidebar.swift
//  quoin-ios-app
//
//  Created by Chavez King on 07/07/2024.
//

import SwiftUI
   
struct SideMenuView: View {
    @Binding var isShowing: Bool
    @State private var selectedOption: SideMenuOption?

    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        VStack {
                            ForEach(SideMenuOption.allOptions.indices, id: \.self) { index in
                                Button(action: {
                                    selectedOption = SideMenuOption.allOptions[index]
                                    isShowing = false
                                }) {
                                    SideMenuRowView(option: SideMenuOption.allOptions[index], selectedOption: $selectedOption)
                                }
                                .buttonStyle(SideMenuButtonStyle())
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color.white)
                    .animation(.easeInOut, value: isShowing)
                    Spacer()
                }
            }
        }
        .transition(.move(edge: .leading))
    }
    
    struct SideMenuRowView: View {
        let option: SideMenuOption
        @Binding var selectedOption: SideMenuOption?
        
        private var isSelected: Bool {
            return selectedOption == option
        }
        
        var body: some View {
            HStack {
                Image(systemName: option.imageName)
                    .imageScale(.small)
                Text(option.heading)
                    .font(.subheadline)
                Spacer()
            }
            .padding(.leading)
            .foregroundColor(isSelected ? .blue : .primary)
            .frame(width: 216, height: 44)
            .background(isSelected ? Color.blue.opacity(0.15) : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    struct SideMenuHeaderView: View {
        var body: some View {
            HStack {
                Button(action: {
                    // Add action for the hamburger menu
                }) {
                    Image("ProfileImage")
//                    Image("ProfilePhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading, 0)
                }
                .padding(.leading, 0)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(Greetings())                        .font(.headline)
                    Text("James")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.leading, 4)
                }
                .padding(.leading, -3)
            }
            .padding(.top, 60)
        }
    }
    
    struct SideMenuOption: Identifiable, Equatable {
        let id = UUID()
        var heading: String
        var imageName: String
        var destination: AnyView
        
        static let allOptions: [SideMenuOption] = [
            SideMenuOption(heading: "Announcements", imageName: "filemenu.and.cursorarrow", destination: AnyView(Text("Dashboard View"))),
            SideMenuOption(heading: "Property View", imageName: "house", destination: AnyView(Text("Performance View"))),
            SideMenuOption(heading: "Profile", imageName: "person", destination: AnyView(Text("Profile View"))),
            SideMenuOption(heading: "Settings", imageName: "magnifyingglass", destination: AnyView(Text("Search View"))),
            SideMenuOption(heading: "Notifications", imageName: "bell", destination: AnyView(Text("Notifications View"))),
            SideMenuOption(heading: "Log Out", imageName: "rectangle.portrait.and.arrow.right", destination: AnyView(Text("Notifications View")))
        ]
        
        static func == (lhs: SideMenuOption, rhs: SideMenuOption) -> Bool {
            lhs.id == rhs.id
        }
    }
}

struct SideMenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(-5)
            .padding(.bottom, 5)
//            .background(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .shadow(radius: 5)
    }
}

#if DEBUG
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
#endif
